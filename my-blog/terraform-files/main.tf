provider "aws" {
  region  = "us-east-1"
  profile = "test"
}

data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

resource "aws_security_group" "ec2_allow_rule" {

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "MYSQL/Aurora"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["172.31.0.0/16"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${chomp(data.http.myip.body)}/32"]
  }

  egress {
    description = "Outbound traffic"
    from_port   = -1
    to_port     = -1
    protocol    = "all"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow ssh,http,https"
  }
}


resource "aws_instance" "wp-blog" {
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.ec2_allow_rule.id]
  key_name               = var.instance_key_name
  provisioner "file" {
    source      = "install.sh"
    destination = "/tmp/install.sh"
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_file_path)
      host        = aws_instance.wp-blog.public_dns
    }
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/install.sh",
      "sudo bash /tmp/install.sh",
    ]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_file_path)
      host        = aws_instance.wp-blog.public_dns
    }
  }
  tags = {
    Name = "wp-blog"
  }
}

resource "aws_eip" "lb" {
  instance = aws_instance.wp-blog.id
  vpc      = true
}