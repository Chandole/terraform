provider "aws" {
  region ="us-east-1"

}

resource "aws_instance" "test" {
ami = var.ami
instance_type = var.instance_type
availability_zone = var.availability_zone
tags = var.tags
}
resource "aws_ebs_volume" "Vol-1" {
    availability_zone = va
  
}