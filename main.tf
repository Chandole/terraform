provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "webserver" {
    ami = ""
    instance_type = "t2.micro"
    tags = var.tags

}