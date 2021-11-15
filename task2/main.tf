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
    availability_zone = var.availability_zone
    size = 10
    tags = {
      "Name" = "Ebs-1"
      "ENV" = "DEV"
    }
  
}
resource "aws_volume_attachment" "ebs_attach" {
    device_name = "/dev/sdd"
    instance_id = aws_instance.test.id
    volume_id = aws_ebs_volume.Vol-1.id 
}

resource "aws_security_group" "SG-test" {
    name = 
  
}