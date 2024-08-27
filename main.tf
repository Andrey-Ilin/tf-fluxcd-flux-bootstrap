provider "flux" {
  kubernetes = {
    config_path = var.config_path
  }
}

resource "flux_bootstrap_git" "this" {
  url = "https://github.com/${var.github_repository}.git"
  branch = "main"
  path = var.target_path
  
  auth = {
    type = "http"
    username = "git"
    password = var.github_token
  }
}