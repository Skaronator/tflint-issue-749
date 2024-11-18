terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.76.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.33.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.4.5"
    }
  }

  required_version = ">= 1.8"
  backend "local" {

  }
}
