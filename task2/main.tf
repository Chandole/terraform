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

output "vpc_id" {
    value = "aws_vpc.vpc.id"
  
}


resource "aws_security_group" "SG-test" {
    name = "SG-test"
    vpc_id = aws_vpc.vpc.id
    
    ingress = [ {
        
    } ]
    
    egress = [ {
      description = "OUT-BOND"
      cidr_blocks = [ "0.0.0.0/0" ]
      from_port = 0
      to_port = 0
      protocol = "-1"
    } ]
     tags = {
    Name = "allow_tls"
  }

}