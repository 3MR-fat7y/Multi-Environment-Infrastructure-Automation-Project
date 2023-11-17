module "network" {
  source = "./network"
  region =var.Region
  net-vpc-cidr = var.vpc-cidr
  public-1-cidr=var.cidr-public-1
  public-2-cidr=var.cidr-public-2
  private-1-cidr=var.cidr-private-1
  private-2-cidr=var.cidr-private-2
}

# module "my_credentials" {
#   source = "./credentials"
# }

 