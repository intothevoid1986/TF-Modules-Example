variable "environment" {
  type = string
  default = "dev"
}
variable "security_group_id" {
  type = string
}
variable "vpc_id" {
  type = string
}
variable "subnet_ids" {
  type = list(string)
}