variable "subnet_cidrs" {
  type = list(string)
}

variable "vpc_cidrs" {
  type = list(string)
}

variable "region" {
  type = string
}

variable "az" {
    type = list(string)
}