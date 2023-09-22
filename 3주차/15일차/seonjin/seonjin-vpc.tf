resource "aws_vpc" "seonjin-vpc" {
    cidr_block = "10.0.0.0/16"
}


resource "aws_subnet" "seonjin-public-subnet-2a" {
    vpc_id = aws_vpc.seonjin-vpc.id
    cidr_block = "10.0.1.0/24"

}

resource "aws_subnet" "seonjin-private-subnet-2a" {
    vpc_id = aws_vpc.seonjin-vpc.id
    cidr_block = "10.0.2.0/24"
}

resource "aws_internet_gateway" "seonjin-igw" {
    vpc_id = aws_vpc.seonjin-vpc.id
}

resource "aws_eip" "seonjin-eip" {
    vpc = true
}

resource "aws_nat_gateway" "seonjin-nat" {
    allocation_id = aws_eip.seonjin-eip.id
    subnet_id = aws_subnet.seonjin-public-subnet-2a.id
}

resource "aws_route_table" "seonjin-public-rtb" {
  vpc_id = aws_vpc.seonjin-vpc.id
}

resource "aws_route_table" "seonjin-private-rtb" {
  vpc_id = aws_vpc.seonjin-vpc.id
}

resource "aws_route" "seonjin-nat-rtb" {
  route_table_id = aws_route_table.seonjin-private-rtb.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.seonjin-nat.id
}

resource "aws_route" "seonjin-igw-rtb" {
  route_table_id = aws_route_table.seonjin-public-rtb.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.seonjin-igw.id
}

resource "aws_route_table_association" "seonjin-public-rtb-as-1" {
  subnet_id = aws_subnet.seonjin-public-subnet-2a.id
  route_table_id = aws_route_table.seonjin-public-rtb.id
}

resource "aws_route_table_association" "seonjin-private-rtb-as-1" {
  subnet_id = aws_subnet.seonjin-private-subnet-2a.id
  route_table_id = aws_route_table.seonjin-private-rtb.id
}
