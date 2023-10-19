resource "aws_instance" "frontend" {
  ami           = data.aws_ami.ami.image_id
  instance_type = "t3.micro"
  vpc_security_group_ids = [data.aws_security_group.sg.name]

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
  ami           = data.aws_ami.ami.image_id
  instance_type = "t3.micro"
  vpc_security_group_ids = [data.aws_security_group.sg.name]

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
  ami           = data.aws_ami.ami.image_id
  instance_type = "t3.micro"
  vpc_security_group_ids = [data.aws_security_group.sg.name]

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