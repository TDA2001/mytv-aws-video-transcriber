terraform {
  backend "s3" {
    bucket                 = "techx-kalliope-dev-tfstate-ap-southeast-1-130506138320"
    dynamodb_table         = "techx-kalliope-dev-tfstate-ap-southeast-1-130506138320"
    encrypt                = true
    key                    = "genai-account-setup/dev-mytv-genai.tfstate"
    region                 = "ap-southeast-1"
    skip_region_validation = true
  }
}
