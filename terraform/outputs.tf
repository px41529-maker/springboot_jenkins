output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_version" {
  value = module.eks.cluster_version
}

output "vpc_id" {
  value = data.aws_vpc.default.id
}

output "subnets" {
  value = data.aws_subnets.default.ids
}