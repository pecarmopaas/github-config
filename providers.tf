provider "github" {}

terraform {
  backend "azurerm" {
    resource_group_name  = "rg-neu-terraform"
    storage_account_name = "stneuterraform"
    container_name       = "githubconfigcontainer"
    key                  = "terraform.tfstate"
  }

  required_providers {
    github = {
      source  = "hashicorp/github"
      version = "~> 6.0"
    }
  }
}

