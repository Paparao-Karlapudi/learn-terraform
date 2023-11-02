data "aws_ami" "test_instance" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
}

resource "aws_instance" "test_instance" {
  ami                    = data.aws_ami.test_instance.id
  instance_type          = var.type == "null" ? "t3.small" : var.type

  tags = {
    Name = "conditions-terraform"
  }
}

variable "type" {
  default = "null"
}