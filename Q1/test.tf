provider "azurerm" {

subscription_id = "6c09f6b4-01df-4db6-aa7b-efd419927344"
client_id       = "4de5eef5-c6e6-47d4-8cee-7c5037ea4ec1"
client_secret   = "24567def-63d9-4889-8017-c6e471c73867"
tenant_id       = "9047eedf-c2a1-4537-bc90-cd5e2a55d9ed"
features {}
}
resource "azurerm_resource_group" "example" {
 name     = "example-resources9999"
 location = "West Europe"
}

resource "azurerm_storage_account" "example" {
 name                     = "examplestoracc8919"
 resource_group_name      = azurerm_resource_group.example.name
 location                 = azurerm_resource_group.example.location
 account_tier             = "Standard"
 account_replication_type = "LRS"
}

resource "azurerm_storage_container" "example" {
 name                  = "conten89191919t"
 storage_account_name  = azurerm_storage_account.example.name
 container_access_type = "private"
}