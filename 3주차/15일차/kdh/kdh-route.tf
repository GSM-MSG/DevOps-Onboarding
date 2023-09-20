resource "aws_route_table" "kdh-public-rtb" {
    vpc_id = aws_vpc.kdh-vpc.id

    tags = {
        Name = "kdh-public-rtb"
    }
}

resource "aws_route_table" "kdh-private-rtb" {
    vpc_id = aws_vpc.kdh-vpc.id

    tags = {
        Name = "kdh-private-rtb"
    }
}

resource "aws_route_table_association" "sms-public-rt-association" {
    subnet_id = aws_subnet.kdh-public-subnet-2a.id
    route_table_id = aws_route_table.kdh-public-rtb.id
}

## Private Subnet Register RTB ##
resource "aws_route_table_association" "sms-private-rt-association" {
    subnet_id = aws_subnet.kdh-private-subnet-2a.id
    route_table_id = aws_route_table.kdh-private-rtb.id
}

## IGW Register RTB ##
resource "aws_route" "public-rt-igw" {
    route_table_id = aws_route_table.kdh-public-rtb.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.kdh-igw.id
}

## Nat Register RTB
resource "aws_route" "private-rt-nat" {
    route_table_id = aws_route_table.kdh-private-rtb.id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.kdh-nat.id
}
