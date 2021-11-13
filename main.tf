provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "webserver" {
    ami = var.ami
    instance_type = var.instance_type
    availability_zone = var.availability_zone
    tags = var.tags
    
}

#resource "aws_volume_attachment" "ebs_att" {
#  device_name = "/dev/sdd"
 # volume_id = aws_ebs_volume.ebs_volume.id
 #  force_detach = true
#} 

output "private_ip" {
    value = aws_instance.webserver.private_ip  
}

output "instance_id" {
    value = aws_instance.webserver.instance_id
  
}
output "volume_id" {
  value = aws_instance.webserver.va
}