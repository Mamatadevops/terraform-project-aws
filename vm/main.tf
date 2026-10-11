resource "azurerm_resource_group" "demo" {
  name     = "rg-github-terraform-demo"
  location = "Central India"

  tags = {
    Environment = "Dev"
    ManagedBy   = "Terraform"
  }
}