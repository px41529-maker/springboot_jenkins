variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "cluster_name" {
  type    = string
  default = "demo-cluster"
}

variable "cluster_version" {
  type    = string
  default = "1.34"
}

variable "instance_type" {
  type    = string
  default = "m7i.large"
}

variable "desired_size" {
  default = 2
}

variable "min_size" {
  default = 1
}

variable "max_size" {
  default = 2
}