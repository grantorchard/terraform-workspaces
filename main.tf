/*provider "github" {
  alias = "personal"
  individual = false
  organization = "grantorchard"
  version    = "2.4.0"
}

provider "github" {
  alias = "hashicorp"
  organization = "hashicorp"
}
*/

terraform {
  required_providers {
    github = {
      source  = "hashicorp/github"
      organization = "grantorchard"
      version = "2.4.0"
      individual = false
      alias = "personal"
    }
    tfe = {
      source = "hashicorp/github"
    }
  }
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

locals {
  ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC8rqxon4hRyV5cLNZczuJTe8dsZ33hpWHDU993r4iiY3t9bXqfmIHlIZ7dTL93nlvsgzVdOYMVGMOHMg/a1ZK0VRoKTS5BBhBGJejjDUfWRAtedZbM9JE5HHpks+L+nf8cOM14Os+Q3BV+z4MjYfIK5ZbV0IvUaY0kscQcE8cZoOTC2hHu/MPDneKJxG+HRQJfvqvnWz69/EXyi9iqtmOn0Xy9905qtbPNlDs1c4qF+zZ1qQCkMYP0Z4AVvLaPEJZlPmDnGqz5s1vVb130aXe1A11eq4RwgvZRxXW8i88pKqCGPuLRh7anqvSI15SLpA2KWvu7wD5CvhTisc/6TfVf"
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

module "terraform-aws-rms" {
  source = "app.terraform.io/grantorchard/workspace/tfe"
  providers = {
    github = github.personal
  }
  repository_name = "terraform-aws-rms"
  create_repo = true
  oauth_token_id = var.oauth_token_id
  env_var = var.aws_env_var
}