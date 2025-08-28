provider "routeros" {
  hosturl  = var.device_settings.hosturl
  username = var.device_settings.username
  password = var.network_password
  insecure = var.insecure
}

terraform {
  required_providers {
    routeros = {
      source  = "terraform-routeros/routeros"
      version = "1.86.3"
    }
  }
}