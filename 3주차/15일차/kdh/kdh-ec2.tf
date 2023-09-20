resource "aws_instance" "kdh-ec2" {
    ami = "ami-04cebc8d6c4f297a3"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.kdh-public-subnet-2a.id
    key_name = "kdh-onboarding"
    associate_public_ip_address = false
    source_dest_check = false

    tags = {
        Name = "kdh-ec2"
    }
}