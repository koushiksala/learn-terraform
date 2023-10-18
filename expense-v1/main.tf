resource "aws_instance" "frontend" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-07f72e9d61983aede"]

  tags = {
    Name = "frontend"
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = "Z07563311KOKE3UKM58XL"
  name    = "frontend.rdevopsb75.online"
  type    = "NS"
  ttl     = "30"
  records = [aws_instance.frontend.private_ip]
}

resource "aws_instance" "backend" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-07f72e9d61983aede"]

  tags = {
    Name = "backend"
  }
}

resource "aws_route53_record" "backend" {
  zone_id = "Z07563311KOKE3UKM58XL"
  name    = "backend.rdevopsb75.online"
  type    = "NS"
  ttl     = "30"
  records = [aws_instance.backend.private_ip]
}

resource "aws_instance" "mysql" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-07f72e9d61983aede"]

  tags = {
    Name = "mysql"
  }
}

resource "aws_route53_record" "mysql" {
  zone_id = "Z07563311KOKE3UKM58XL"
  name    = "mysql.rdevopsb75.online"
  type    = "NS"
  ttl     = "30"
  records = [aws_instance.mysql.private_ip]
}