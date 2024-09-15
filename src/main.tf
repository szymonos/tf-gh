provider "github" {
  owner = "szymonos"
}

resource "github_repository" "foo" {
  name      = var.repo_name
  auto_init = true
}

resource "github_repository_file" "foo" {
  repository          = github_repository.foo.name
  branch              = "dev"
  file                = ".gitignore"
  content             = "**/*.tfstate"
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@example.com"
  overwrite_on_create = true
  autocreate_branch   = true
}
