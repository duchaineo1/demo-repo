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
  name       = "Terraform Example"
  public_key = file("/home/oduchaine/.ssh/digitalocean.pub")
}

resource "digitalocean_droplet" "web" {
  image  = "ubuntu-22-04-x64"
  name   = "web-1"
  region = "nyc3"
  size   = "s-1vcpu-1gb"
  ssh_keys = [digitalocean_ssh_key.dev-key.fingerprint]
  tags = ["terraform"]
}
