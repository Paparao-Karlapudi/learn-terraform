provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "test_instance" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
}

resource "aws_instance" "test_instance" {
  ami           = data.aws_ami.test_instance.id
  instance_type = "t3.micro"

  tags = {
    Name = "terraform_test"
  }
}

terraform {
  backend "s3" {
    bucket = "terraform-pappik"
    key    = "05-remote-state/terraform.tfstate"
    region = "us-east-1"
  }
}