output "api_management_id" {
  description = "The ID of the API Management service"
  value       = azurerm_api_management.example.id
}

output "api_management_name" {
  description = "The name of the API Management service"
  value       = azurerm_api_management.example.name
}

output "api_management_api_url" {
  description = "The URL of the API in API Management"
  value       = "https://${azurerm_api_management.example.gateway_url}/node-demo"
}
