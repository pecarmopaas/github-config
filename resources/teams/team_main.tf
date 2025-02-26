module "infra-team" {
  source           = "../../modules/team"
  team_name        = "infra"
  team_description = "Infrastructure team"
  team_privacy     = "closed"
  team_members     = ["pedromicarmo"]
}
