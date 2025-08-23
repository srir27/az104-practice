variable "subscription_id" {
  description = "The ID of the Azure subscription where the resources will be created."
  type        = string


}
variable "rgname" {
  type = string
  validation {
    condition     = length(var.rgname) >= 3 && length(var.rgname) <= 24
    error_message = "The resource group name must be between 3 and 24 characters."
  }
}
variable "location" {
  type = string
  # default = "North Europe"
  validation {
    condition     = contains(["North Europe", "West Europe", "East US", "West US", "Central US"], var.location)
    error_message = "The location must be one of the following: North Europe, West Europe, East US, West US, Central US."
  }
}
