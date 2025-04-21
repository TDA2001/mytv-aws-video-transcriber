###############################################################################
# Sagemaker Module
###############################################################################
module "sagemaker" {
  source = "../../modules/sagemaker"
  general_prefix          = local.general_prefix
  region                  = local.region

  sagemaker_role_name         = var.sagemaker_role_name
  whisper_large_model_name    = var.whisper_large_model_name
  whisper_large_instance_type = var.whisper_large_instance_type
  whisper_large_hf_model_id   = var.whisper_large_hf_model_id
  whisper_large_hf_task       = var.whisper_large_hf_task
}
