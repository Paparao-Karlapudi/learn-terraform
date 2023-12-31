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

resource "null_resource" "provision" {
  triggers = {
    instance_id = aws_instance.test_instance.id
  }
  provisioner "remote-exec" {
    connection {
      host     = aws_instance.test_instance.public_ip
      user     = "centos"
      password = "DevOps321"
    }
      inline = [
      "echo Hello"
     ]
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}