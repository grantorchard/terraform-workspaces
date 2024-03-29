variable tfe_workspace_name {
  type = string
  default = ""
}

variable oauth_token_id {
  type = string
}

variable tfe_org_name {
  type = string
  default = "grantorchard"
}

variable tfe_auto_apply {
  type = bool
  default = true
}

variable repository_name {
  type = string
  default = ""
}

variable repository_private {
  type = bool
  default = false
}

variable template_repository_owner {
  type = string
  default = "grantorchard"
}

variable template_repository_name {
  type = string
  default = "terraform-repository-template"
}

variable aws_env_var {
  default = {
    "AWS_REGION" = {
      "value" = "ap-southeast-2",
      "sensitive" = false
    }
  }
}

variable vsphere_env_var {
  type = map
  default = {
    "VSPHERE_USER" = {
      "value" = "",
      "sensitive" = false
    },
    "VSPHERE_PASSWORD" = {
      "value" = "",
      "sensitive" = true
    },
    "VSPHERE_SERVER" = {
      "value" = "",
      "sensitive" = false
    },
    "VSPHERE_ALLOW_UNVERIFIED_SSL" = {
      "value" = true,
      "sensitive" = false
    }
  }
}

variable azure_env_var {
  type = map
  default = {
    "ARM_CLIENT_ID" = {
      "value" = "",
      "sensitive" = true
    }
    "ARM_CLIENT_SECRET" = {
      "value" = "",
      "sensitive" = true
    }
    "ARM_SUBSCRIPTION_ID" = {
      "value" = "",
      "sensitive" = true
    }
    "ARM_TENANT_ID" = {
      "value" = "",
      "sensitive" = true
    }
  }
}

variable slack_webhook {
  type = map
  default = {}
}

variable vault_addr {
	default = "https://vault-cluster.vault.11eb56d6-0f95-3a99-a33c-0242ac110007.aws.hashicorp.cloud:8200"
}

variable vault_namespace {
	default = "admin"
}