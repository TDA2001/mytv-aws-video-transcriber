variable "sagemaker_role_name" {
  description = "The name of the IAM role for SageMaker"
  type        = string
}

variable "region" {
  type        = string
  description = "AWS region"
}


# model whisper-large
variable "whisper_large_model_name" {
  description = "The name of the SageMaker whisper model"
  type        = string
}

variable "whisper_large_instance_type" {
  description = "The instance type used for the SageMaker whisper model"
  type        = string
}

variable "whisper_large_hf_model_id" {
  description = "The Hugging Face model ID for whisper"
  type        = string
}

variable "whisper_large_hf_task" {
  description = "The Hugging Face model task for whisper"
  type        = string
}

variable "general_prefix" {
  description = "The prefix for the resources"
  type        = string
}