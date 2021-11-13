provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "webserver" {
    ami = var.ami
    instance_type = var.instance_type
    availability_zone = var.availability_zone
    tags = var.tags
    
}

resource "aws_volume_attachment" "ebs_att" {
 device_name = "/dev/sdd"
 volume_id = aws_instance.webserver.id
  force_detach = fa
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

