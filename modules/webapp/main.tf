terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

data "aws_ami" "debian_latest" {
  owners      = ["136693071363"]
  most_recent = true
  name_regex  = "debian-13-arm64-*"
}

resource "random_pet" "vm" {
  keepers = {
    # Generate a new pet name each time we switch to a new AMI id
    ami_id = data.aws_ami.debian_latest.id
  }
}

locals {
  webserver_config_data = templatefile("${path.module}/scripts/user-data.sh",
    {
      server_name = random_pet.vm.id
      server_port = var.server_port
  })
}
