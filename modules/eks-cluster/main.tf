data "aws_iam_policy" "cluster" {
  name = "AmazonEKSClusterPolicy"
}

data "aws_iam_policy" "vpc" {
  name = "AmazonEKSVPCResourceController"
}

resource "aws_eks_cluster" "this" {
  name     = "${var.context_prefix}-cluster"
  role_arn = aws_iam_role.this.arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  depends_on = [
    aws_iam_role_policy_attachment.cluster,
    aws_iam_role_policy_attachment.vpc
  ]
}

resource "aws_iam_role" "this" {
  name = "${var.context_prefix}-cluster-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "eks.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "cluster" {
  role       = aws_iam_role.this.name
  policy_arn = data.aws_iam_policy.cluster.arn
}

resource "aws_iam_role_policy_attachment" "vpc" {
  role       = aws_iam_role.this.name
  policy_arn = data.aws_iam_policy.vpc.arn
}
