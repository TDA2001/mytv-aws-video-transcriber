resource "aws_iam_role" "sagemaker_role" {
  name = "${var.general_prefix}-${var.sagemaker_role_name}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "sagemaker.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_policy_attachment" "sagemaker_full_access" {
  name       = "${var.general_prefix}-sagemaker-full-access-attachment"
  roles      = [aws_iam_role.sagemaker_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonSageMakerFullAccess"
}

# model whisper-large
resource "aws_sagemaker_model" "whisper_large_sagemaker_model" {
  name = var.whisper_large_model_name
  execution_role_arn = aws_iam_role.sagemaker_role.arn

  primary_container {
    image = "763104351884.dkr.ecr.${var.region}.amazonaws.com/huggingface-pytorch-inference:2.1.0-transformers4.37.0-gpu-py310-cu118-ubuntu20.04"
    environment = {
      HF_MODEL_ID = var.whisper_large_hf_model_id
      HF_TASK = var.whisper_large_hf_task
    }
  }
}

resource "aws_sagemaker_endpoint_configuration" "whisper_large_sagemaker_endpoint_configuration" {
  name = "${var.general_prefix}-${var.whisper_large_model_name}"

  production_variants {
    initial_instance_count = 1
    instance_type = var.whisper_large_instance_type
    model_name = aws_sagemaker_model.whisper_large_sagemaker_model.name
    variant_name = "AllTraffic"
    container_startup_health_check_timeout_in_seconds = 300
  }
}

resource "aws_sagemaker_endpoint" "whisper_large_sagemaker_endpoint" {
  name = "${var.general_prefix}-${var.whisper_large_model_name}"
  endpoint_config_name = aws_sagemaker_endpoint_configuration.whisper_large_sagemaker_endpoint_configuration.name
}
