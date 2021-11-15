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
    name = "SG-test"
    vpc_id = aws_vpc_id.test.id
    
    ingress = [ {
      cidr_blocks = [ "aws_vpc.test.cidr_block" ]
      description = "v"
      from_port = 1
      ipv6_cidr_blocks = [ "value" ]
      prefix_list_ids = [ "value" ]
      protocol = "value"
      security_groups = [ "value" ]
      self = false
      to_port = 1
    } ]
}