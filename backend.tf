terraform {
  backend "azurerm" {
    resource_group_name  = "demo-webapp"
    storage_account_name = "haseendemoacc"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}