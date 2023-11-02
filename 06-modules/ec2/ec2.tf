resource "aws_instance" "test_instance" {
  ami                    = data.aws_ami.test_instance.id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [var.security_group_id]
  tags = {
    Name = "terraform_test"
  }
}