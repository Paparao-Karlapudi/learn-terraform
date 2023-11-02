resource "aws_instance" "test_instance" {
  ami           = data.aws_ami.test_instance.id
  instance_type = var.instance_type

  tags = {
    Name = var.name
  }
}

data "aws_ami" "test_instance" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
}

#output "publicip" {
#  #  value = aws_instance.test_instance.*.public_ip
#  value = {
#    for k, v in aws_instance.test_instance : k => v.public_ip
#  }
#}
variable "name" {}
variable "instance_type" {}

output "ec2" {
  value = aws_instance.test_instance
}