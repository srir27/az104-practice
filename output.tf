output "webappname" {
  value = azurerm_linux_web_app.app.default_hostname
}
