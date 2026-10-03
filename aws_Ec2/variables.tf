variable "ami-id" {
  default = "ami-0c614dee691cbbf37"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key-pair" {
  default = "demo-web-key"
}

variable "subnet_id" {
  default = "subnet-0cea3e92229f56412"
}

variable "sg-id" {
  default = ["sg-02ad7a816711b725f"]
}

variable "ec2-name" {
  default = "web-demo-ec2"
}

variable "az" {
  default = "us-east-1b"
}

variable "alb-subnet" {
  default = ["subnet-0cea3e92229f56412", "subnet-0e975aa3b26152d83"]
}

variable "s3_bucket_name" {
  default = "mamata6759280"
}

variable "vpc_id" {
  default = "vpc-0f4a30aa66878998c"
}