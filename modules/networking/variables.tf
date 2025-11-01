variable "environment" {
  type = string
  default = "dev"
}
variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/24"
}
variable "availability_zones" {
  type = list(string)
}