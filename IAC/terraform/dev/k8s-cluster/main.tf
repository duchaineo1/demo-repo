terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

variable "do_token" {}

provider "digitalocean" {
  token = var.do_token
}

terraform {
  backend "s3" {
    bucket = "terraform-backends"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
    endpoint = "https://nyc3.digitaloceanspaces.com"
    skip_credentials_validation = true
    skip_metadata_api_check = true
  }
}

resource "digitalocean_ssh_key" "dev-key" {
  name       = "cluster_01"
  public_key = file(var.ssh_public_key_path)
}

resource "digitalocean_droplet" "cluster01" {
  image  = var.droplet_image_name
  name   = var.droplet_cluster_name
  region = var.droplet_region_name
  size   = var.droplet_size
  ssh_keys = [digitalocean_ssh_key.dev-key.fingerprint]
  tags = ["terraform"]
}
