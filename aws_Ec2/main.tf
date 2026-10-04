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

## Adding ebs volume 

resource "aws_ebs_volume" "additional" {
  availability_zone = var.az
  size              = 4

  tags = {
    Name = "HelloWorldebs"
  }
}

## attaching ebs volume to ec2 instance

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.additional.id
  instance_id = aws_instance.web-ec2.id
}

resource "aws_s3_bucket" "example" {
  bucket        = var.s3_bucket_name
  force_destroy = true
  tags = {
    Name        = var.s3_bucket_name
    Environment = "Dev"
  }
}

##load balancer alb..............
resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.sg-id
  subnets            = var.alb-subnet

  enable_deletion_protection = false

  access_logs {
    bucket  = aws_s3_bucket.example.id
    prefix  = "test-lb"
    enabled = false
  }

  tags = {
    Environment = "dev"
    Name        = "test-lb-tf"
  }
}
##Target group
resource "aws_lb_target_group" "ip-example" {
  name        = "tf-example-lb-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = var.vpc_id
}

## Listner load balancer
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.test.arn
  port              = "80"
  protocol          = "HTTP"
  #ssl_policy        = "ELBSecurityPolicy-2016-08"
  #certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ip-example.arn
  }
}

## tg attachement.....................................

resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.ip-example.arn
  target_id        = aws_instance.web-ec2.id
  port             = 80
}