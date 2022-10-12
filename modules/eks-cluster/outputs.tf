output "name" {
  value       = aws_eks_cluster.this.name
  description = "The name of this cluster"
}

output "endpoint" {
  value       = aws_eks_cluster.this.endpoint
  description = "The endpoint of this cluster"
}

output "cert_authority" {
  value       = aws_eks_cluster.this.certificate_authority[0].data
  description = "The Certificate Authority of this cluster"
}
