terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }

  backend "gcs" {
    bucket = "khai_wah_bucket"
    prefix = "terraform/stage3"
  }
}

provider "google" {
  project = "devopalt"
  region  = "us-east1"
}
