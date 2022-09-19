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
