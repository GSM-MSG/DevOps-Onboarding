resource "aws_internet_gateway" "kdh-igw" {
  vpc_id = aws_vpc.kdh-vpc.id

  tags = {
    Name = "kdh-igw"
  }
}