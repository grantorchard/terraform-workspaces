provider "github" {
  alias = "personal"
  individual = false
  organization = "grantorchard"
  version    = "2.4.0"
}

provider "github" {
  alias = "hashicorp"
  organization = "hashicorp"
}

module "terraform-aws-awx" {
  source = "app.terraform.io/grantorchard/workspace/tfe"
  providers = {
    github = github.personal
  }
  repository_name = "terraform-aws-awx"
  oauth_token_id = var.oauth_token_id
  env_var = var.aws_env_var
}

module "terraform-aws-core" {
  source = "app.terraform.io/grantorchard/workspace/tfe"
  providers = {
    github = github.personal
  }
  repository_name = "terraform-aws-core"
  oauth_token_id = var.oauth_token_id
  env_var = var.aws_env_var
}

module "hashicat-vsphere" {
  source = "app.terraform.io/grantorchard/workspace/tfe"
  providers = {
    github = github.personal
  }
  repository_name = "hashicat-vsphere"
  oauth_token_id = var.oauth_token_id
  env_var = var.vsphere_env_var
}

module "terraform-aws-aviatrix" {
  source = "app.terraform.io/grantorchard/workspace/tfe"
  providers = {
    github = github.personal
  }
  repository_name = "terraform-aws-aviatrix"
  oauth_token_id = var.oauth_token_id
  env_var = var.aws_env_var
}

module "threat-exercise-101-group-a" {
  source = "app.terraform.io/grantorchard/workspace/tfe"
  providers = {
    github = github.personal
  }
  repository_name = "group-a"
  oauth_token_id = var.oauth_token_id
  env_var = var.vsphere_env_var
  tf_var = {
    "port_group_vlan_id" = {
      "value" = "10",
      "sensitive" = false
    }
  }
}

module "threat-exercise-101-group-b" {
  source = "app.terraform.io/grantorchard/workspace/tfe"
  providers = {
    github = github.personal
  }
  repository_name = "group-b"
  oauth_token_id = var.oauth_token_id
  env_var = var.vsphere_env_var
  tf_var = {
    "port_group_vlan_id" = {
      "value" = "11",
      "sensitive" = false
    }
  }
}

module "threat-exercise-101-group-c" {
  source = "app.terraform.io/grantorchard/workspace/tfe"
  providers = {
    github = github.personal
  }
  repository_name = "group-c"
  oauth_token_id = var.oauth_token_id
  env_var = var.vsphere_env_var
  tf_var = {
    "port_group_vlan_id" = {
      "value" = "12",
      "sensitive" = false
    }
  }
}

module "terraform-azure-vault" {
  source = "app.terraform.io/grantorchard/workspace/tfe"
  providers = {
    github = github.personal
  }
  repository_name = "terraform-azure-vault"
  create_repo = false
  oauth_token_id = var.oauth_token_id
  env_var = merge(var.azure_env_var, var.aws_env_var)
}
