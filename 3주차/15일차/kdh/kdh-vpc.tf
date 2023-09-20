data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_vpc" "kdh-vpc" {
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "kdh-vpc"
  }
}

resource "aws_subnet" "kdh-public-subnet-2a" {
  vpc_id = aws_vpc.kdh-vpc.id
  cidr_block = "10.0.0.0/25"
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
        Name = "kdh-public-subnet-2a"
    }
}

resource "aws_subnet" "kdh-private-subnet-2a" {
  vpc_id = aws_vpc.kdh-vpc.id
  cidr_block = "10.0.0.128/25"
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
        Name = "kdh-private-subnet-2a"
    }
}