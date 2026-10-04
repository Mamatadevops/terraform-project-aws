variable "ami-id" {
  default = "ami-0d27e0fb3bac4d724"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key-pair" {
  default = "demo-key"
}

variable "subnet_id" {
  default = "subnet-0a0520ba45497e315"
}

variable "sg-id" {
  default = ["sg-03985cb46830d5ea9"]
}

variable "ec2-name" {
  default = "web-demo-ec2"
}

variable "vpc_id" {
  default = "vpc-0c15f2f16024c664d "
}
