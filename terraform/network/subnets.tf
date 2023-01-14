resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.your_vpc.id
  cidr_block = var.subnet_cidrs[0]
  availability_zone = var.az[0]
  map_public_ip_on_launch =  true
  tags = {
    Name = "public-subnet"
  }
}