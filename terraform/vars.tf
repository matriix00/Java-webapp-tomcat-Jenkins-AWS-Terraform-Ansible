variable "region" {
  type = string
}

variable "vpc_cidrs" {
  type = list
}

variable "subnet_cidrs" {
  type = list
}

variable "az" {
    type = list(string)
}