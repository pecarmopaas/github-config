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
  branch_protection_config = [
    {
      branch_name                     = "main"
      dismiss_stale_reviews           = true
      require_code_owner_reviews      = false
      require_last_push_approval      = true
      required_approving_review_count = 1
      status_checks_strict            = false
      restrictions_users              = []
    }
  ]
}

module "items-service" {
  source = "../../modules/repository"
  repo_config = {
    repo_name        = "items-service"
    repo_description = ""
  }
  branch_protection_config = [
    {
      branch_name                     = "main"
      dismiss_stale_reviews           = true
      require_code_owner_reviews      = false
      require_last_push_approval      = true
      required_approving_review_count = 1
      status_checks_strict            = false
      restrictions_users              = []
    }
  ]
}

module "infra" {
  source = "../../modules/repository"
  repo_config = {
    repo_name        = "infra"
    repo_description = ""
  }
}

