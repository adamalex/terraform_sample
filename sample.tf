provider "azurerm" {
  version = "~> 0.1"
}

resource "azurerm_resource_group" "sstfrg3" {
  name     = "sstfrg3"
  location = "Central US"
}

resource "azurerm_app_service_plan" "sstfasp" {
  name                = "sstfasp"
  resource_group_name = "${azurerm_resource_group.sstfrg3.name}"
  location            = "${azurerm_resource_group.sstfrg3.location}"

  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_storage_account" "sstfsa" {
  name                = "sstfsa"
  resource_group_name = "${azurerm_resource_group.sstfrg3.name}"
  location            = "${azurerm_resource_group.sstfrg3.location}"
  account_type        = "Standard_GRS"
}

resource "azurerm_container_registry" "sstfcr" {
  name                = "sstfcr"
  resource_group_name = "${azurerm_resource_group.sstfrg3.name}"
  location            = "${azurerm_resource_group.sstfrg3.location}"
  admin_enabled       = true
  sku                 = "Basic"

  storage_account {
    name       = "${azurerm_storage_account.sstfsa.name}"
    access_key = "${azurerm_storage_account.sstfsa.primary_access_key}"
  }
}