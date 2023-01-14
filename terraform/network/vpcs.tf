resource "aws_vpc" "your_vpc" {
  cidr_block = var.vpc_cidrs[0]
   tags = {
    Name = "tomcat-vpc"
  }
}