variable "context_name" {
  type        = string
  description = "The common aggregate name for your use-case i.e. customer name or environment etc."
}

variable "engine" {
  type        = string
  description = "The engine runtime to use for this cluster"
}

variable "engine_version" {
  type        = string
  description = "The engine runtime version to use for this cluster"
}

variable "az_names" {
  type        = list(string)
  description = "Your list of availability zones to deploy this cluster to"
}

variable "db_name" {
  type        = string
  description = "The SQL-safe name for the database itself"
}

variable "username" {
  type        = string
  sensitive   = true
  description = "The username for the cluster db user"
}

variable "password" {
  type        = string
  sensitive   = true
  description = "The password for the cluster db user"
}
