variable "oci_tenancy_ocid" {
  description = "The OCID of the tenancy."
  type        = string
}

variable "oci_user_ocid" {
  description = "The OCID of the user."
  type        = string
}

variable "oci_private_key" {
  description = "The API's Private key."
  type        = string
  default     = ""
}

variable "oci_private_key_path" {
  description = "The local path to the private API key."
  type        = string
  default     = ""
}

variable "oci_private_key_fingerprint" {
  description = "The fingerprint for the user's API key."
  type        = string
}

variable "oci_region" {
  description = "The region to deploy to."
  type        = string
}

variable "cloudflare_api_token" {
  description = "The Cloudflare API token."
  type        = string
  sensitive   = true
}

variable "cloudflare_zone_id" {
  description = "The Cloudflare zone ID."
  type        = string
}

variable "cloudflare_account_id" {
  description = "The Cloudflare account ID."
  type        = string
}

variable "cloudflare_dns_records" {
  description = "The DNS records to create."
  type = list(object({
    name    = string
    comment = optional(string)
    type    = string
    value   = string
    ttl     = optional(number)
    proxied = optional(bool)
  }))
}

variable "domain" {
  description = "The domain to deploy to."
  type        = string
}

variable "catedral_prod_ssh_public_key" {
  description = "The public SSH key to use for the catedral-prod instance."
  type        = string
  sensitive   = true
}

variable "catedral_stage_ssh_public_key" {
  description = "The public SSH key to use for the catedral-stage instance."
  type        = string
  sensitive   = true
}
