terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

variable "github_token" {
  description = "GitHub Token"
}

# Configure the GitHub Provider
provider "github" {
  token = var.github_token
}

resource "github_repository" "my_first_terraform_repo" {
  name        = "my_first_terraform_repo"
  description = "My awesome codebase"
  visibility  = "public"
  auto_init   = true

}

resource "github_branch" "development" {
  repository = github_repository.my_first_terraform_repo.name
  branch     = "development"
}

resource "github_branch" "testing" {
  repository = github_repository.my_first_terraform_repo.name

  branch = "testing"
}

resource "github_branch" "another_branch" {
  repository = github_repository.my_first_terraform_repo.name

  branch = "another_branch"

}
