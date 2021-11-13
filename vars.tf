variable "ami" {
type =  string
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
  Name = "Instance-test"
  Env = "Dev"
}  
}

variable "device_name" {
  type = list(string)
  default=["/dev/sdd"]
  
  }