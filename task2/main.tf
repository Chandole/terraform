provider "aws" {
  region ="us-east-1"

}

resource "aws_instance" "test" {
ami = var.ami
instance_instance_type =   
}