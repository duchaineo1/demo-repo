variable "droplet_region_name" {
    type = string
    default = "nyc3"
}

variable "droplet_cluster_name" {
    type = string
    default = "cluster01"
}

variable "ssh_public_key_path" {
    type = string
    default = "/home/oduchaine/.ssh/digitalocean.pub"
}

variable "droplet_image_name" {
    type = string
    default = "ubuntu-22-04-x64"
}

variable "droplet_size" {
    type = string
    default = "s-2vcpu-2gb"
}
