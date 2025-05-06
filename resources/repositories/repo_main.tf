module "github_config" {
  source = "../../modules/repository"
  repo_config = {
    repo_name        = "github-config"
    repo_description = "This repository contains the configuration for the GitHub organization."
  }
  apply_default_branch_protection_rules = false
}

module "users-service" {
  source = "../../modules/repository"
  repo_config = {
    repo_name        = "users-service"
    repo_description = ""
  }
}

module "items-service" {
  source = "../../modules/repository"
  repo_config = {
    repo_name        = "items-service"
    repo_description = ""
  }
}

module "infra" {
  source = "../../modules/repository"
  repo_config = {
    repo_name        = "infra"
    repo_description = ""
  }
}

module "test-repo" {
  source = "../../modules/repository"
  repo_config = {
    repo_name        = "test-repo"
    repo_description = "test-repo-desc"
    repo_visibility  = "public"
  }
}
