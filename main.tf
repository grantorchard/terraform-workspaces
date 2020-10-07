provider "github" {
  alias = "personal"
  individual = false
  organization = "grantorchard"
  version    = "2.4.0"
}

locals {
  ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC8rqxon4hRyV5cLNZczuJTe8dsZ33hpWHDU993r4iiY3t9bXqfmIHlIZ7dTL93nlvsgzVdOYMVGMOHMg/a1ZK0VRoKTS5BBhBGJejjDUfWRAtedZbM9JE5HHpks+L+nf8cOM14Os+Q3BV+z4MjYfIK5ZbV0IvUaY0kscQcE8cZoOTC2hHu/MPDneKJxG+HRQJfvqvnWz69/EXyi9iqtmOn0Xy9905qtbPNlDs1c4qF+zZ1qQCkMYP0Z4AVvLaPEJZlPmDnGqz5s1vVb130aXe1A11eq4RwgvZRxXW8i88pKqCGPuLRh7anqvSI15SLpA2KWvu7wD5CvhTisc/6TfVf"
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

module "terraform-azure-vault" {
  source = "app.terraform.io/grantorchard/workspace/tfe"
  providers = {
    github = github.personal
  }
  repository_name = "terraform-azure-vault"
  create_repo = false
  oauth_token_id = var.oauth_token_id
  env_var = merge(var.azure_env_var, var.aws_env_var)
  tf_var = merge({
    "ssh_public_key" = {
      "value" = local.ssh_public_key,
      "sensitive" = false
    }
  },
  var.slack_webhook)
}

module "terraform-aws-vault" {
  source = "app.terraform.io/grantorchard/workspace/tfe"
  providers = {
    github = github.personal
  }
  repository_name = "terraform-aws-vault"
  create_repo = true
  oauth_token_id = var.oauth_token_id
  env_var = var.aws_env_var
  tf_var = merge({
    "ssh_public_key" = {
      "value" = local.ssh_public_key,
      "sensitive" = false
    }
  },
  var.slack_webhook)
}

module "terraform-aws-consul" {
  source = "app.terraform.io/grantorchard/workspace/tfe"
  providers = {
    github = github.personal
  }
  repository_name = "terraform-aws-consul"
  create_repo = true
  oauth_token_id = var.oauth_token_id
  env_var = var.aws_env_var
  tf_var = merge({
    "ssh_public_key" = {
      "value" = local.ssh_public_key,
      "sensitive" = false
    }
  },
  var.slack_webhook)
}

module "terraform-nsx-core" {
  source = "app.terraform.io/grantorchard/workspace/tfe"
  providers = {
    github = github.personal
  }
  repository_name = "terraform-nsx-core"
  create_repo = false
  oauth_token_id = var.oauth_token_id
}

module "terraform-nsx-selfserve" {
  source = "app.terraform.io/grantorchard/workspace/tfe"
  providers = {
    github = github.personal
  }
  repository_name = "terraform-nsx-selfserve"
  create_repo = true
  oauth_token_id = var.oauth_token_id
}

module "terraform-aws-venafi" {
  source = "app.terraform.io/grantorchard/workspace/tfe"
  providers = {
    github = github.personal
  }
  repository_name = "terraform-aws-venafi"
  create_repo = true
  oauth_token_id = var.oauth_token_id
  env_var = var.aws_env_var
}

module "terraform-vmc-single-node" {
  source = "app.terraform.io/grantorchard/workspace/tfe"
  providers = {
    github = github.personal
  }
  repository_name = "terraform-vmc-single-node"
  create_repo = true
  oauth_token_id = var.oauth_token_id
  env_var = var.aws_env_var
}

module "terraform-vmc-zerocloud" {
  source = "app.terraform.io/grantorchard/workspace/tfe"
  providers = {
    github = github.personal
  }
  repository_name = "terraform-vmc-zerocloud"
  create_repo = true
  oauth_token_id = var.oauth_token_id
  env_var = var.aws_env_var
}

module "terraform-vmc-dfw" {
  source = "app.terraform.io/grantorchard/workspace/tfe"
  providers = {
    github = github.personal
  }
  repository_name = "terraform-vmc-dfw"
  create_repo = true
  oauth_token_id = var.oauth_token_id
  env_var = var.aws_env_var
}

module "terraform-vmc-vm" {
  source = "app.terraform.io/grantorchard/workspace/tfe"
  providers = {
    github = github.personal
  }
  repository_name = "terraform-vmc-vm"
  create_repo = true
  oauth_token_id = var.oauth_token_id
  env_var = var.aws_env_var
}

module "terraform-vmc-rds" {
  source = "app.terraform.io/grantorchard/workspace/tfe"
  providers = {
    github = github.personal
  }
  repository_name = "terraform-vmc-rds"
  create_repo = true
  oauth_token_id = var.oauth_token_id
  env_var = var.aws_env_var
}

module "terraform-vmc-aws-core" {
  source = "app.terraform.io/grantorchard/workspace/tfe"
  providers = {
    github = github.personal
  }
  repository_name = "terraform-aws-core"
  tfe_workspace_name = "terraform-vmc-aws-core"
  create_repo = false
  oauth_token_id = var.oauth_token_id
  env_var = var.aws_env_var
}

module "terraform-aws-eks" {
  source = "app.terraform.io/grantorchard/workspace/tfe"
  providers = {
    github = github.personal
  }
  repository_name = "terraform-aws-eks"
  oauth_token_id = var.oauth_token_id
}