module "github_config" {
  source = "../../modules/repository"
  repo_config = {
    repo_name        = "github-config"
    repo_description = "This repository contains the configuration for the GitHub organization."
  }
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

