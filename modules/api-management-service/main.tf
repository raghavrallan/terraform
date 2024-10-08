resource "azurerm_api_management" "example" {
  name                = var.api_management_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.sku_name

  publisher_email = var.publisher_email
  publisher_name  = var.publisher_name
}

# API definition in API Management that points to the existing container app
resource "azurerm_api_management_api" "container_api" {
  name                = "node-demo-api"
  resource_group_name = azurerm_api_management.example.resource_group_name
  api_management_name = azurerm_api_management.example.name
  revision            = "1"
  display_name        = "Node Demo API"
  path                = "node-demo"
  protocols           = ["https"]

  # Import the API directly from the existing container app using the URL of the container app
  # import_url          = "https://${var.container_app_fqdn}/swagger.json" # Assuming your container app exposes a swagger.json at its root for API Management to import
}

# Policy to route traffic from API Management to the existing container app
resource "azurerm_api_management_api_policy" "api_policy" {
  api_name            = azurerm_api_management_api.container_api.name
  api_management_name = azurerm_api_management.example.name
  resource_group_name = azurerm_api_management.example.resource_group_name

  xml_content = <<XML
  <policies>
    <inbound>
      <base />
      <!-- Setting the backend service URL to the container app FQDN -->
      <set-backend-service base-url="https://${var.container_app_fqdn}" />
    </inbound>
    <backend>
      <forward-request />
    </backend>
    <outbound>
      <base />
    </outbound>
    <on-error>
      <base />
    </on-error>
  </policies>
  XML
}
