provider "aws" {
    region = "us-east-1"
}
#Create New Instance
resource "aws_instance" "webserver" {
    ami = var.ami
    instance_type = var.instance_type
    availability_zone = var.availability_zone
    tags = var.tags
    
}

#Create New EBS
resource "aws_ebs_volume" "Ebs-Vol1" {
  availability_zone = var.availability_zone
  size = 10
  tags = {
    "Name" = "ebs-vol-1"
  }
  
}
#attach New EBS to instance
resource "aws_volume_attachment" "ebs_attach" {
 device_name = "/dev/sdd"
 instance_id = aws_instance.webserver.id
 volume_id = aws_ebs_volume.Ebs-Vol1.id
  
} 

#Generate New Elastic Ip & Attach to Instance
resource "aws_eip" "webserver_eip" {
  instance = aws_instance.webserver.id
  tags = {
    Name = "EIP"
  }
  
}

#IAM 

output "private_ip" {
    value = aws_instance.webserver.private_ip  
}


output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.webserver.id
}
output "volume_id" {
  description = "volume_id of the EC2 instance"
  value       = aws_instance.webserver.id
}
