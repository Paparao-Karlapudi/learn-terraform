data "aws_ami" "example" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
    }

output "ami_info" {
  value = data.aws_ami.example
}

data "aws_instance" "foo" {
  instance_id = "i-0f23e50a18a7702c5"
}

output "workstation_public_ip" {
  value = data.aws_instance.foo.public_ip
}