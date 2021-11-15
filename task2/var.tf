variable "ami" {
type = string
default = "ami-0b0af3577fe5e3532"
}
variable "instance_type" {
  
  type = string
  default = "t2.micro"
}
variable "availability_zone" {
  type = string
  default = "us-east-1b"
  
}
variable "tags" {
type = map(string)
default = {
  Name = "Test"
  Env = "Dev"
}  
}
variable "ingress" {
     description = "Allow SG-HTTP"
      cidr_blocks = [ "0.0.0.0/0" ]
      from_port = 80
      to_port = 80
      protocol = "tcp"  
  
}

    variable "" {
      
    }