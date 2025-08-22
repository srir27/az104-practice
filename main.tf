resource "azurerm_resource_group" "rg" {
  name     = "nikelandingpage-resources"
  location = "North Europe"
}

resource "azurerm_service_plan" "asp" {
  name                = "artifact-service-plan"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "F1"

}

resource "azurerm_linux_web_app" "app" {
  name                = "artifact-app"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_service_plan.rg.location
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {
    application_stack {
      node_version = "18-lts"
    }
    always_on = false
   }
}