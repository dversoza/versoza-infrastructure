data "oci_identity_tenancy" "root" {
  tenancy_id = var.tenancy_ocid
}

resource "oci_identity_compartment" "root" {
  name        = data.oci_identity_tenancy.root.name
  description = "The root Compartment for the ${data.oci_identity_tenancy.root.name} tenancy"
}

data "oci_identity_availability_domain" "availability_domain" {
  compartment_id = var.tenancy_ocid
  ad_number      = 1
}
