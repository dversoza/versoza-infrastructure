terraform {
  required_version = ">= 1.3.2, < 2.0.0"

  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 4.103.0, < 5.0.0"
    }
  }

  cloud {
    organization = "dversoza"

    workspaces {
      name = "oracle-cloud-infrastructure"
    }
  }
}

provider "oci" {
  auth             = "APIKey"
  tenancy_ocid     = var.oci_tenancy_ocid
  user_ocid        = var.oci_user_ocid
  private_key      = var.oci_private_key
  private_key_path = var.oci_private_key_path
  fingerprint      = var.oci_private_key_fingerprint
  region           = var.oci_region

  ignore_defined_tags = [
    "Oracle-Tags.CreatedBy",
    "Oracle-Tags.CreatedOn",
  ]
}
