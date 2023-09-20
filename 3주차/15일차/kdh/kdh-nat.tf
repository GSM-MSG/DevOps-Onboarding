resource "aws_eip" "nat_ip" {
    domain = "vpc"

    lifecycle {
        create_before_destroy = true
    }
}

resource "aws_nat_gateway" "kdh-nat" {
  allocation_id = aws_eip.nat_ip.id
  subnet_id = aws_subnet.kdh-private-subnet-2a.id


  tags = {
        Name = "kdh-nat"
  }
  depends_on = [aws_internet_gateway.kdh-igw]
}