.ONESHELL:

SHELL := /bin/bash

test-test:
	echo "Calling apply for test"
	terraform -chdir=./fixture init
	terraform -chdir=./fixture plan -var-file="../../examples/bastion.tfvars"
	terraform -chdir=./fixture apply -var-file="../../examples/bastion.tfvars" -auto-approve
	terraform -chdir=./fixture destroy -var-file="../../examples/bastion.tfvars" -auto-approve

test-bastion:
	echo "Calling test-bastion"
	go test -v -timeout 45m
clean:
	@find . -name terraform.tfstate -type f -exec rm -rf {} +
	@find . -name terraform.tfstate.backup -type f -exec rm -rf {} +
	@find . -name .terraform -type d -exec rm -rf {} +
	@find . -name .terraform.lock.hcl -type f -exec rm -rf {} +