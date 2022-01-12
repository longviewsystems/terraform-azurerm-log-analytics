.ONESHELL:

SHELL := /bin/bash

test-loganalytics:
	echo "Calling test-loganalytics"
	az group create --name RG-TF-Test-LA --location canadacentral
	go test -v -timeout 45m
	az group delete --name RG-TF-Test-LA --yes
clean:
	@find . -name terraform.tfstate -type f -exec rm -rf {} +
	@find . -name terraform.tfstate.backup -type f -exec rm -rf {} +
	@find . -name .terraform -type d -exec rm -rf {} +
	@find . -name .terraform.lock.hcl -type f -exec rm -rf {} +