resource "aws_instance" "web-ec2" {
  ami                    = var.ami-id
  instance_type          = var.instance_type
  key_name               = var.key-pair
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.sg-id
  user_data              = file("apachescripts.sh")

  tags = {
    Name = var.ec2-name
  }
}

