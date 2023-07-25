# # Terraform Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.0" 
    }  
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
#   subscription_id = "97f95932-7b38-4660-b54b-d45699d1048f"
}

# Provider Block
provider "azurerm" {
  alias = "subscription-1"
  skip_provider_registration = true
  subscription_id = "e98e4cf8-e0d5-487e-92e6-d9b50d2df8f9"
 features {}          
}

