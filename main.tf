provider "flux" {
  kubernetes = {
    config_path = var.config_path
  }
  git = {
    url = "https://github.com/${var.github_repository}.git"
    branch = "main"
    http = {
      username = "git"
      password = var.github_token
    }
  }
}

resource "null_resource" "dependency_setter" {
  triggers = {
    dependency_id = var.depends_on_hack == null ? "" : var.depends_on_hack
  }
}

resource "flux_bootstrap_git" "this" {
  path = var.target_path
  timeouts = {
    create = "30m"
    update = "30m"
    delete = "30m"
  }
}
