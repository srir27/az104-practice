resource "azurerm_resource_group" "rg" {
  name     = var.rgname
  location = var.location
}

resource "azurerm_service_plan" "asp" {
  name                = "${var.rgname}-asp"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "S1"

}

resource "azurerm_linux_web_app" "app" {
  name                          = "${var.rgname}-app"
  resource_group_name           = azurerm_resource_group.rg.name
  location                      = azurerm_service_plan.asp.location
  service_plan_id               = azurerm_service_plan.asp.id
  public_network_access_enabled = true
  depends_on                    = [azurerm_service_plan.asp]

  site_config {
    application_stack {
      dotnet_version = "8.0"
    }
  }
}
resource "azurerm_linux_web_app_slot" "stage" {
  name           = "${var.rgname}-appstage"
  app_service_id = azurerm_linux_web_app.app.id
  depends_on     = [azurerm_linux_web_app.app]
  site_config {
    application_stack {
      dotnet_version = "8.0"
    }
  }
}

# resource "time_sleep" "sleep" {
#   create_duration = "10s"
#   depends_on      = [azurerm_linux_web_app.app]
# }

