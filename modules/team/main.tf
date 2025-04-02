resource "github_team" "team" {
  name           = var.team_name
  description    = var.team_description
  privacy        = var.team_privacy
  parent_team_id = var.parent_team_id != "" ? var.parent_team_id : null
}

resource "github_team_members" "team_member" {
  team_id = github_team.team.id

  dynamic "members" {
    for_each = concat(var.team_members, var.team_maintainers)
    content {
      username = members.value
      role     = contains(var.team_maintainers, members.value) ? "maintainer" : "member"
    }
  }
}

resource "github_team_repository" "team_repo" {
  for_each   = var.repo
  team_id    = github_team.team.id
  repository = each.key
  permission = each.value
}
