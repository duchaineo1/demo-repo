variables "instance_ami" {
  type = string
  default = "ami-09e67e426f25ce0d7"
}

variables "instance_type" {
  type = string
  default = "t2.micro"
}

variables "instance_key_name" {
    type = string
    default = "Prod"
}