terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.62.0"
    }
  }
}

provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIAXS3EEQKYPARAVKOH"
  secret_key = "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"
}

resource "aws_instance" "demo_instance" {
  ami                    = "ami-06489866022e12a14"
  instance_type          = "t2.micro"
  user_data              = <<EOF
		#!/bin/bash
		yum update -y
		yum install -y httpd.x86_64
		systemctl start httpd.service
		systemctl enable httpd.service
		echo ?Hello World from $(hostname -f)? > /var/www/html/index.html
	EOF
  tags = {
    Name = "Demo_Instance"
  }
}
