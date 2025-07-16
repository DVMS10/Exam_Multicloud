variable "aws_access_key" {
    description = "AWS Access Key"
    type        = string
}

variable "aws_secret_key" {
    description = "AWS Secret Key"
    type        = string
}

variable "aws_region" {
    description = "AWS Region"
    type        = string
}

variable "gcp_credentials_file" {
    description = "Chemin du fichier JSON du compte de service"
    type        = string
}

variable "gcp_project" {
    description = "ID du projet Google Cloud"
    type        = string
}

variable "gcp_zone" {
    description = "Zone Google Cloud"
    type        = string
    default = "europe-west1-b"
}

