variable "region" {
  type        = string
  description = "AWS region"
  default     = "ap-southeast-1"
}

variable "assume_role" {
  type        = string
  description = "Role to assume"
  default     = "arn:aws:iam::339713139041:role/genai-ops-service-role-cicd"
}

variable "sagemaker_role_name" {
  description = "The name of the IAM role for SageMaker"
  type        = string
  default     = "sagemaker_execution_role"
}

# model whisper-large-v3
variable "whisper_large_model_name" {
  description = "The name of the SageMaker whisper model"
  type        = string
  default     = "whisper-large-v3" 
}

variable "whisper_large_instance_type" {
  description = "The instance type used for the SageMaker whisper model"
  type        = string
  default     = "ml.g5.xlarge"
}

variable "whisper_large_hf_model_id" {
  description = "The Hugging Face model ID for whisper"
  type        = string
  default     = "openai/whisper-large-v3"
}

variable "whisper_large_hf_task" {
  description = "The Hugging Face model task for whisper"
  type        = string
  default     = "automatic-speech-recognition"
}