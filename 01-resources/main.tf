resource "aws_instance" "web" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_route53_record" "dev-ns" {
  zone_id = "Z07563311KOKE3UKM58XL"
  name    = "test.rdevopsb75.online"
  type    = "NS"
  ttl     = "30"
  records = [aws_instance.web.private_ip]
}