# Credentials
variable "region" {
  default =  "us-east-1"
}

variable "default_az" {
  default =  "us-east-1a"
}

variable "profile" {
  default = "prod-matob"
}

# Naming
variable "default_tag" {
  default = "project-01-sre"
}

# SSH
variable "ssh_user" {
  default = "ec2-user"
}

variable "ssh_key_name" {
  default = "key-pair-project-01-sre"
}

variable "ssh_key_path" {
  default = "~/.ssh/key-pair-project-01-sre.pem"
}

# RDS
variable "db_instance_class" {
  default = "db.t2.micro"
}

variable "db_engine" {
  default = "mysql"
}

variable "db_engine_version" {
  default = "5.7.38"
}

variable "db_parameter_group_name" {
  default = "default.mysql5.7"
}

variable "db_name" {
  default = "blog"
}

variable "db_user" {
  default = "wpuser"
}

variable "db_password" {
  default = "NarTivEldEnTleTO"
}
