# Outputs
output "arn_model_stt" {
  value = aws_sagemaker_endpoint.whisper_large_sagemaker_endpoint.arn
}