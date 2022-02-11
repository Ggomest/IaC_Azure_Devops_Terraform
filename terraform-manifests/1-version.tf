



terraform {
  required_version = ">= 1.0.0"
  required_providers {
      azurerm = {
      source = "hashicorp/azurerm"
      version = ">=2.0"
    }
  }



  
  #Terraform State Storage to Azure storage container (values will be taken from Azure DevOps)
  backend "azurerm" {
    
  }
}

provider "azurerm" {
  features {
    
  }
}
