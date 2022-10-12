data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  context_prefix = "awslocal-demo"
}

# Once our cluster has been created, we need to update our kubectl
# context to interact with it, you can do this with the command...
# aws --endpoint-url http://localhost:4566 eks update-kubeconfig --name <cluster-name>
module "cluster" {
  source = "./modules/eks-cluster"

  context_prefix = local.context_prefix
  subnet_ids     = data.aws_subnets.default.*.id
}

module "eks_nodes" {
  source = "./modules/eks-node"

  context_prefix = local.context_prefix
  cluster_name   = module.cluster.name
  subnet_ids     = data.aws_subnets.default.*.id
}
