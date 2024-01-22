resource "azurerm_storage_account" "new_sacc" {
  name                     = "${var.s_acc}demo"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}