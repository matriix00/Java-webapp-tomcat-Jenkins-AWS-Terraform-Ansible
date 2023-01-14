
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.your_vpc.id

  tags = {
    name = "public-route-table"
  }
}


resource "aws_route_table_association" "public_ass_routetable" {
  
 route_table_id = aws_route_table.public_route_table.id
 subnet_id = aws_subnet.public_subnet.id

}



#######igw###################

resource "aws_route" "igw_route" {

    route_table_id = aws_route_table.public_route_table.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  

}
