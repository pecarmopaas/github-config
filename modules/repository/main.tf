resource "github_repository" "repo" {
  name                 = var.repo_config.repo_name
  visibility           = var.repo_config.repo_visibility
  description          = var.repo_config.repo_description
  has_downloads        = var.repo_config.has_downloads
  has_issues           = var.repo_config.has_issues
  has_projects         = var.repo_config.has_projects
  vulnerability_alerts = var.repo_config.vulnerability_alerts
}

resource "github_branch_protection_v3" "branch_protection" {
  for_each = { for rule in var.branch_protection_config : rule.branch_name => rule }

  repository = github_repository.repo.name
  branch     = each.value.branch_name

  required_pull_request_reviews {
    dismiss_stale_reviews           = each.value.dismiss_stale_reviews
    require_code_owner_reviews      = each.value.require_code_owner_reviews
    require_last_push_approval      = each.value.require_last_push_approval
    required_approving_review_count = each.value.required_approving_review_count
  }

  required_status_checks {
    strict = each.value.status_checks_strict
  }

  restrictions {
    users = each.value.restrictions_users
  }
}
