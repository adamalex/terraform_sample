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