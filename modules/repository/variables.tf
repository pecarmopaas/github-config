variable "repo_config" {
  type = object({
    repo_name            = string
    repo_description     = string
    repo_visibility      = optional(string, "public")
    has_downloads        = optional(bool, true)
    has_issues           = optional(bool, true)
    has_projects         = optional(bool, true)
    vulnerability_alerts = optional(bool, true)
  })
}

variable "branch_protection_config" {
  type = list(
    object({
      branch_name                     = string
      dismiss_stale_reviews           = bool
      require_code_owner_reviews      = bool
      require_last_push_approval      = bool
      required_approving_review_count = number
      status_checks_strict            = bool
      restrictions_users              = list(string)
    })
  )
  default = []
}