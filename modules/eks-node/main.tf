resource "aws_eks_node_group" "example" {
  cluster_name    = var.cluster_name
  node_group_name = "${var.context_prefix}-node-group"
  node_role_arn   = aws_iam_role.this.arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks,
    aws_iam_role_policy_attachment.cni,
    aws_iam_role_policy_attachment.ec2,
  ]
}

resource "aws_iam_role" "this" {
  name = "${var.context_prefix}-node-group-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

data "aws_iam_policy" "eks" {
  name = "AmazonEKSWorkerNodePolicy"
}

data "aws_iam_policy" "cni" {
  name = "AmazonEKS_CNI_Policy"
}

data "aws_iam_policy" "ec2" {
  name = "AmazonEC2ContainerRegistryReadOnly"
}

resource "aws_iam_role_policy_attachment" "eks" {
  role       = aws_iam_role.this.name
  policy_arn = data.aws_iam_policy.eks.arn
}

resource "aws_iam_role_policy_attachment" "cni" {
  role       = aws_iam_role.this.name
  policy_arn = data.aws_iam_policy.cni.arn
}

resource "aws_iam_role_policy_attachment" "ec2" {
  role       = aws_iam_role.this.name
  policy_arn = data.aws_iam_policy.ec2.arn
}
