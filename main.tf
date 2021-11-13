provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "webserver" {
    ami = var.ami
    instance_type = var.instance_type
    availability_zone = var.availability_zone
    tags = var.tags
    user_data = var.user_data
}
