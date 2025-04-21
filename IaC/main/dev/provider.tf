provider "aws" {
  assume_role {
    role_arn = var.assume_role
    duration = "1h"
  }
  region = var.region
}