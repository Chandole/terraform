provider "aws" {
    region = "us-east-1"
}
#Creat New Instance
resource "aws_instance" "webserver" {
    ami = var.ami
    instance_type = var.instance_type
    availability_zone = var.availability_zone
    tags = var.tags
    
}

#Creat New EBS
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

#IAM User  
resource "aws_iam_user" "shubham" {
name = "shubham"  
}
#IAM Group Creat
resource "aws_iam_group" "developers" {
  name = var.aws_iam_group.name
}
#Iam User added in group
resource "aws_iam_group_membership" "team" {
  name =  var.aws_iam_group_membership.team.name
  users = var.aws_iam_user.shubham.shubham
  group = aws_iam_group.developers.name
}


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
