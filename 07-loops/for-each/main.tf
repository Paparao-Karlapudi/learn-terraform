resource "aws_instance" "test_instance" {
  count         = length(var.components)
  ami           = data.aws_ami.test_instance.id
  instance_type = "t3.micro"

  tags = {
    Name = var.components[count.index]
  }
}

data "aws_ami" "test_instance" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
}

output "publicip" {
  value = aws_instance.test_instance.*.public_ip
}

variable "components" {
  default = ["cart", "catalogue"]
}