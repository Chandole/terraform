variable "tags" {
type = map(string)
default = {
  Name = "Instance-test"
  Env = "Dev"
}  
}
variable "instance_type" {
  type = string
  default = "t2.micro"
  
}