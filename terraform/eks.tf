module "eks" {

  source  = "terraform-aws-modules/eks/aws"
  version = "20.37.2"

  cluster_name    = "demo-cluster"
  cluster_version = "1.34"

cluster_endpoint = true

  vpc_id     = data.aws_vpc.default.id
  subnet_ids = data.aws_subnets.default.ids

  eks_managed_node_groups = {
    default = {

      instance_types = [var.instance_type]

      ami_type       = "AL2023_x86_64_STANDARD"

      desired_size   = var.desired_size
      min_size       = var.min_size
      max_size       = var.max_size

    }
  }

  tags = {
    Project = "SpringBoot-EKS"
    Owner   = "Prakash"
  }
}
