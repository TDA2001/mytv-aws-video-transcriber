locals {
  master_prefix = "techx"
  app_prefix = "genai"
  env_prefix = "dev"
  general_prefix = "${local.master_prefix}-${local.app_prefix}-${local.env_prefix}"
  region = "ap-southeast-1"
  account_id = data.aws_caller_identity.current.account_id
}