terraform {
  backend "remote" {
    organization = "dimafrost"

    workspaces {
      name = "finalProject"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "ec2" {
  source = "./modules/EC2"
  name = "final-project"
}