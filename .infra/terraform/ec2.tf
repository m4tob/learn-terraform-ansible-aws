resource "aws_security_group" "sg_web" {
  name        = "sg_web"
  description = "Security Group Web"
  vpc_id      = aws_vpc.default.id

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  
  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "sg-web-${var.default_tag}"
  }
}

resource "local_file" "tf_ansible_vars" {
  filename = "../ansible/defaults/variables.yml"
  content = <<-EOF
    db_host: "${aws_db_instance.default.address}"
    db_port: "${aws_db_instance.default.port}"
    db_name: "${var.db_name}"
    db_user: "${var.db_user}"
    db_password: "${var.db_password}"
  EOF

  depends_on = [
    aws_db_instance.default
  ]
}

resource "aws_instance" "default" {
  ami                         = var.ec2_ami
  instance_type               = var.ec2_instance_type
  key_name                    = var.ssh_key_name
  subnet_id                   = aws_subnet.sn_public_a.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg_web.id]
  monitoring                  = true

  tags = {
    Name = "ec2-${var.default_tag}"
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i ${aws_instance.default.public_ip}, --private-key ${var.ssh_key_path} ../ansible/main.yml"
  }

  depends_on = [
    aws_db_instance.default
  ]
}

output "public_ip" {
  value = aws_instance.default.public_ip
}