provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "webserver" {
    ami = var.ami
    instance_type = var.instance_type
    availability_zone = var.availability_zone
    tags = var.tags
    aws_volume_attachment
}


output "private_ip" {
    value = aws_instance.webserver.private_ip  
}