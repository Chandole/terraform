provider "aws" {
  region ="us-east-1"

}

#instance launch
resource "aws_instance" "test" {
ami = var.ami
instance_type = var.instance_type
availability_zone = var.availability_zone
tags = var.tags
}

#EBS creation
resource "aws_ebs_volume" "Vol-1" {
    availability_zone = var.availability_zone
    size = 10
    tags = {
      "Name" = "Ebs-1"
      "ENV" = "DEV"
    }
  
}
#EBS attach
resource "aws_volume_attachment" "ebs_attach" {
    device_name = "/dev/sdd"
    instance_id = aws_instance.test.id
    volume_id = aws_ebs_volume.Vol-1.id 
}

#Security Group Creation
resource "aws_security_group" "SG-test" {
    name = "SG-test"
    vpc_id = aws_vpc.vpc.id
    ingress = [{
     description = "Allow SG-HTTP"
      cidr_blocks = [ "0.0.0.0/0" ]
      from_port = "80"
      to_port = "80"
      protocol = "tcp"  
  
}]
    egress = [{
      description = "OUT-BOND"
      cidr_blocks = [ "0.0.0.0/0" ]
      from_port = 0
      to_port = 0
      protocol = "-1"
      
    }]

    tags = {
      Name = "SG-test"
  }

}