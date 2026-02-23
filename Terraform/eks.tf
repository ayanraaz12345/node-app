module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.0.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.29"
  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  enable_irsa = true

  eks_managed_node_groups = {
    default = {
      instance_types = ["c7i-flex.large"]

      min_size     = 1
      max_size     = 2
      desired_size = 1
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}