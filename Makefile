#!/bin/bash

init:
	terraform -chdir=.infra/terraform init

plan:
	terraform -chdir=.infra/terraform plan

up:
	terraform -chdir=.infra/terraform apply

rebuild-instance:
	terraform -chdir=.infra/terraform apply -replace="aws_instance.default"

down:
	terraform -chdir=.infra/terraform destroy