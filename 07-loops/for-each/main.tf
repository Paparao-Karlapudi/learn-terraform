resource "aws_instance" "test_instance" {
  for_each      = var.components
  ami           = data.aws_ami.test_instance.id
  instance_type = each.value.instance_type

  tags = {
    Name = each.value.name
  }
}

data "aws_ami" "test_instance" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
}

output "publicip" {
#  value = aws_instance.test_instance.*.public_ip
  value = {
    for k, v in aws_instance.test_instance : k => v.public_ip
  }
}

variable "components" {
  default = {
    cart = {
      name = "cart"
      instance_type = "t3.small"
    }
    catalogue = {
      name = "catalogue"
      instance_type = "t3.micro"
    }
  }
}