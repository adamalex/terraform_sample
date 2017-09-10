provider "azurerm" {
  version = "~> 0.1"
}

resource "azurerm_resource_group" "ss_tf_rg" {
  name     = "ss_tf_rg"
  location = "Central US"
}

resource "azurerm_app_service_plan" "ss_tf_asp" {
  name                = "ss_tf_asp"
  location            = "Central US"
  resource_group_name = "${azurerm_resource_group.ss_tf_rg.name}"

  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_application_insights" "ss_tf_ai" {
  name                = "ss_tf_ai"
  location            = "Central US"
  resource_group_name = "${azurerm_resource_group.ss_tf_rg.name}"
  application_type    = "Web"
}

resource "azurerm_storage_account" "ss_tf_sa" {
  name                = "ss_tf_sa"
  resource_group_name = "${azurerm_resource_group.ss_tf_rg.name}"
  location            = "${azurerm_resource_group.ss_tf_rg.location}"
  account_type        = "Standard_GRS"
}

resource "azurerm_container_registry" "ss_tf_cr" {
  name                = "ss_tf_cr"
  resource_group_name = "${azurerm_resource_group.ss_tf_rg.name}"
  location            = "${azurerm_resource_group.ss_tf_rg.location}"
  admin_enabled       = true
  sku                 = "Basic"

  storage_account {
    name       = "${azurerm_storage_account.ss_tf_sa.name}"
    access_key = "${azurerm_storage_account.ss_tf_sa.primary_access_key}"
  }
}