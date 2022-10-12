variable "context_prefix" {
  type        = string
  description = "The common aggregate name [prefix] for your use-case i.e. customer name or environment etc."
}

variable "cluster_name" {
  type        = string
  description = "The name of your K8s cluster."
}

variable "subnet_ids" {
  type        = list(string)
  description = "The list of VPC subnet IDs the cluster is bound to."
}
