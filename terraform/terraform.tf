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
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key      = var.private_key
  private_key_path = var.private_key_path
  region           = var.region

  ignore_defined_tags = [
    "Oracle-Tags.CreatedBy",
    "Oracle-Tags.CreatedOn",
  ]
}
