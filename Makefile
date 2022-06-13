.ONESHELL:

SHELL := /bin/bash


apply:
	az group create --name RG-TF-Test-LA --location canadacentral
	echo "Calling apply for log analytics"
	terraform init
	terraform apply -var-file="examples/log-analytics.tfvars" -auto-approve
destroy:
	echo "Calling destroy for log analytics"
	terraform destroy -var-file="examples/log-analytics.tfvars" -auto-approve
	az group delete --name RG-TF-Test-LA --yes
clean:
	@find . -name terraform.tfstate -type f -exec rm -rf {} +
	@find . -name terraform.tfstate.backup -type f -exec rm -rf {} +
	@find . -name .terraform -type d -exec rm -rf {} +  
	@find . -name .terraform.lock.hcl -type f -exec rm -rf {} +
	@find . -name providers -type d -exec rm -rf {} +