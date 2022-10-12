# AWS on localhost with Terraform

This is a work in progress but the plan is to grow it into a context-specific sandbox to simulate a number of real-world scenarios without having to foot the bill of actual cloud services or navigate the headache that can be black box resources.

## You Should Know

The resources being used here are sadly locked away behind Localstack's pay wall, so you're going to need a license key if you want to make active use of this repo. That said, it's quite cheap and I'd recommend **every** engineer gets one, if only to fund the effort!

## Getting Started

You will need to spin up the container for LocalStack, you can do this with `make up` or as a more manual approach `docker-compose up --build`. Once you have localstack running as a container you can run the basic Terraform loop to scaffold your infrastructure, or you can copy-paste this `terraform init && terraform apply -auto-approve`.
