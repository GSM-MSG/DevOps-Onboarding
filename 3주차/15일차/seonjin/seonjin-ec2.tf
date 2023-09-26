resource "aws_instance" "seonjin-ec2" {
  ami           = "ami-0a10b2721688ce9d2"
  instance_type = "t2.micro"
}