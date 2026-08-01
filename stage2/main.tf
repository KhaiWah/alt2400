variable "DJANGO_SECRET_KEY_PROD" {}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }

  backend "gcs" {
    bucket = "khai_wah_bucket"
    prefix = "terraform/stage2"
  }
}

provider "google" {
  project = "devopalt"
  region  = "us-east1"
}

resource "google_cloud_run_v2_service" "khaiwah-cloudrun" {
  name     = "acmp-khaiwah-instance"
  location = "us-east1"

  template {
    containers {
      name  = "final-app"
      image = "us-east1-docker.pkg.dev/devopalt/khaiwah-repo/final:latest"

      ports {
        container_port = 8000
      }

      env {
        name  = "DJANGO_SECRET_KEY"
        value = var.DJANGO_SECRET_KEY_PROD
      }

      env {
        name  = "ALLOWED_HOSTS"
        value = "*"
      }

      resources {
        limits = {
          cpu    = "1"  
          memory = "512Mi" 
        }
      }
    }
  }

  traffic {
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
    percent = 100
  }
}

resource "google_cloud_run_v2_service_iam_member" "public_access" {
  name     = google_cloud_run_v2_service.khaiwah-cloudrun.name
  location = google_cloud_run_v2_service.khaiwah-cloudrun.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}

