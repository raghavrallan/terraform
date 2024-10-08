variable "location" {
  description = "The location where resources will be deployed"
  default     = "East US"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  default     = "raghav-vulnerabilities"
}

variable "api_management_name" {
  description = "The name of the API Management service"
  default     = "testing-01"
}

variable "sku_name" {
  description = "The SKU of the API Management service"
  default     = "Consumption"
}


variable "publisher_email" {
  description = "The email address of the API Management service publisher"
  default     = "rallanraghav@mooglelabs.com"
}

variable "publisher_name" {
  description = "The name of the API Management service publisher"
  default     = "Moogle Labs"
}

variable "subscription_id" {
  description = "The xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx subscription ID"
  type        = string
  default     = "2a7fbfec-65ec-42d6-9ba3-fbf34a07f907"
}

variable "container_app_fqdn" {
  description = "The fully qualified domain name of the existing container app"
  type        = string
  default     = "node-demo.agreeablepond-01a23f02.centralus.azurecontainerapps.io" # Replace this with the actual FQDN of your container app
}
