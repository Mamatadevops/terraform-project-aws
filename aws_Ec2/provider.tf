provider "aws" {
  region = "us-east-1"

}

# terraform {
#   backend "s3" {
#     encrypt        = true
#     bucket         = "mamata5679786"
#     dynamodb_table = "terraform-state-lock-dynamo"
#     key            = "dev/vpc/terraform.tfstate"
#     #key    = "nonprod/ecr/terraform.tfstate"
#     region = "ap-south-1"
#   }
# }

# provider "aws" {
#   alias = "ohio"
#   region = "us-east-2"
# }