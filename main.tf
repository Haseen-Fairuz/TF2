terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.56.0"
    }
  }
}

provider "azurerm" {
  features {

  }
}
variable "rg_name" {
  type = map(string)

  default = {
    "dev"   = "dev_rg"
    "stage" = "stage_rg"
    "prod"  = "prod_rg"
  }
}
module "ResourceGroup" {
  source   = "./modules/ResourceGroup"
  rg_name  = lookup(var.rg_name, terraform.workspace, "dev_rg")
  location = "eastus"
}
module "StorageAccount" {
  source              = "./modules/StorageAccount"
  s_acc               = "straccv1"
  resource_group_name = module.ResourceGroup.rg_name_output
  location            = "eastus"
}