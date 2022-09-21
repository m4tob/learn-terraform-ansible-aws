resource "aws_security_group" "sg_rds" {
  name        = "sg_rds"
  description = "Security Group RDS"
  vpc_id      = aws_vpc.default.id

  ingress {
    description      = "MYSQL/Aurora"
    from_port        = 3306
    to_port          = 3306
    protocol         = "TCP"
    security_groups  = ["${aws_security_group.sg_web.id}"]
  }

  tags = {
    Name = "sg-rds-${var.default_tag}"
  }
}

resource "aws_db_subnet_group" "default" {
  name       = "sng-rds-${var.default_tag}"
  subnet_ids = [aws_subnet.sn_private_a.id, aws_subnet.sn_private_b.id]

  tags = {
    Name = "sng-rds-${var.default_tag}"
  }
}

resource "aws_db_instance" "default" {
  instance_class         = var.db_instance_class
  engine                 = var.db_engine
  engine_version         = var.db_engine_version
  parameter_group_name   = var.db_parameter_group_name

  identifier             = "rds-${var.default_tag}"

  storage_type           = "gp2"
  allocated_storage      = 20
  max_allocated_storage  = 0
  
  skip_final_snapshot    = true
  publicly_accessible    = false
  multi_az               = false
  # db_name              = "blog"
  username               = var.db_user
  password               = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.default.name
  vpc_security_group_ids = [aws_security_group.sg_rds.id]
  availability_zone      = var.default_az

  tags = {
    Name = "rds-${var.default_tag}"
  }
}
