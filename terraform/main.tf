variable "azurerm_resource_group_name" {
  type    = string
  default = "ODL-azure-1168822"
}

variable "azurerm_resource_group_location" {
  type    = string
  default = "West US"
}

resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "aks-poc-01"
  resource_group_name = var.azurerm_resource_group_name
  location            = var.azurerm_resource_group_location

  dns_prefix = "dns-poc-aks-01"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "B2s"
  }
  identity {
    type = "SystemAssigned"
  }
  #   service_principal {
  #     client_id     = "your-service-principal-client-id"
  #     client_secret = "your-service-principal-client-secret"
  #   }

  network_profile {
    network_plugin = "azure"
  }
}
