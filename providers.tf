terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.2.0"
    }
    google = {
      source = "hashicorp/google"
      version = "6.42.0"
    }
    tls = {
      source = "hashicorp/tls"
      version = "4.1.0"
    }
    local = {
      source = "hashicorp/local"
      version = "2.5.3"
    }
  }

  required_version = ">= 1.8.0"
}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

provider "google" {
  project     = var.gcp_project
  zone      = var.gcp_zone
  credentials = file(var.gcp_credentials_file)
}


