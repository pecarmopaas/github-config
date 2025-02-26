variable "team_name" {
  type = string
}

variable "team_description" {
  type = string
}

variable "team_privacy" {
  type = string
  default = "closed"
}

variable "parent_team_id" {
  type    = string
  default = ""
}

variable "team_members" {
  type = list(string)
  default = []
}
