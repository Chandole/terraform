variable "ami" {
typtype =  string
d  
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
  Name = "Instance-test"
  Env = "Dev"
}  
}