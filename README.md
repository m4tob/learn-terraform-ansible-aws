# Learn - Terraform + Ansible + AWS

Project to learn about infra as code. In this project, a wordpress blog is provisioned in AWS with RDS as database using Terraform and Ansible. This project is a task of SRE Eleven Works course.


[<img src=".github/terraform_logo.png" alt="terraform" style="width:150px; margin-right: 20px;"/>](https://www.terraform.io/)
[<img src=".github/ansible_logo.png" alt="ansible" style="width:120px; margin-right: 20px;"/>](https://www.ansible.com/)
[<img src=".github/aws_logo.png" alt="aws" style="width:150px; margin-right: 20px;"/>](https://aws.amazon.com/)


# Mandatory Resources:
## Terraform
- [x] VPC
- [x] Subnet
- [x] Route Tables
- [x] Internet Gateway
- [x] Security Groups

- [x] RDS
- [x] EC2 Instance

## Ansible
- [x] nginx
- [x] php-fpm
- [x] WordPress

# Optional Resources:
- [ ] Memcache
- [ ] Load Balancer
- [ ] Auto Scaling
- [ ] Alta Disponibilidade com Multi AZ
- [ ] CDN/WAF: Cloudflare + Serviço WAF

# Commands Makefile
| Command          | Description                          |
|-----------------:|:-------------------------------------|
| init             | Init terraform                       |
| plan             | Show terraform changes               |
| up               | Apply terraform changes              |
| rebuild-instance | Recreate EC2 instance with Ansible   |
| down             | Destroy terraform resources          |