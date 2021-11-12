provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "webserver" {
    ami = "ami-0b0af3577fe5e3532"
    instance_type = "t2.micro"
    tags = var.tags

}