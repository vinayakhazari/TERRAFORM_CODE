# Terraform Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.0" 
      configuration_aliases = [azurerm.subscription-1]
    }  
  }
}

# # Provider Block
# provider "azurerm" {
#   alias = "subscription-1"
#   skip_provider_registration = true
#   subscription_id = "e98e4cf8-e0d5-487e-92e6-d9b50d2df8f9"
#  features {}          
# }

