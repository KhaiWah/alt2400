terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }

  # Configures your remote state tracking backend to use your live GCP bucket
  backend "gcs" {
    bucket = "khai_wah_bucket"
    prefix = "terraform/stage1"
  }
}

provider "google" {
  project = "devopalt"
  region  = "us-east1"
}

# Replaces Azure Container Registry (ACR) with Google Artifact Registry (GAR)
resource "google_artifact_registry_repository" "khaiwah-GAR" {
  location      = "us-east1"
  repository_id = "khaiwah-repo"
  description   = "Docker registry for the Django application"
  format        = "DOCKER"
}
