variable "tags" {
type = map(string)
default = {
  Name = "Instance-test"
  Env = "Dev"
}  
}
variable "associate_public_ip" {
  
}