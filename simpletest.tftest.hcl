variables{
  rgname = var.rgname
}

run "rgname_validation" {
  command = plan
  assert {
    condition     = var.rgname == "ankthweb"
    error_message = "The resource group name must be between 3 and 24 characters."
  }
}

