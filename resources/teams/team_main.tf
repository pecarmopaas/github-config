module "infra-team" {
  source           = "../../modules/team"
  team_name        = "infra"
  team_description = "Infrastructure team"
  team_privacy     = "closed"
  team_members     = ["pedromicarmo"]
  team_maintainers = ["pedromicarmo"]

  repo = {
    "infra" = "push"
  }
}

module "users-service-team" {
  source           = "../../modules/team"
  team_name        = "users-service"
  team_description = "Users service team"
  team_privacy     = "closed"
  team_members     = ["pedromicarmo"]
  team_maintainers = ["pedromicarmo"]

  repo = {
    "users-service" = "push"
  }
}

module "items-service-team" {
  source           = "../../modules/team"
  team_name        = "items-service"
  team_description = "Items service team"
  team_privacy     = "closed"
  team_members     = ["pedromicarmo"]
  team_maintainers = ["pedromicarmo"]

  repo = {
    "items-service" = "push"
  }
}
