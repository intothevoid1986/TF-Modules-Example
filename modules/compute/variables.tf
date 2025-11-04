variable "environment" {
  default = "dev"
  type = string
}
variable "ami_id" {
  type = string
}
variable "instance_type" {
  default = "t2.micro"
  type = string
}
variable "security_group_id" {
  type = string
}
variable "subnet_ids" {
  type = list(string)
}
