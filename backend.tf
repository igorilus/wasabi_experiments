terraform {
    backend "remote" {
    hostname     = "app.terraform.io"
    organization = "sandbox-inc"

    workspaces {
      name   = "wasabi_experiments"
      prefix = ""
    }
  }

/*  backend "local" {
    path = "terraform.tfstate"
  }*/
}
