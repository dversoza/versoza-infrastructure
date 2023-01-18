resource "oci_core_vcn" "vcn" {
  compartment_id = oci_identity_compartment.root.id
}

resource "oci_core_dhcp_options" "default_dhcp_options" {
  compartment_id = oci_identity_compartment.root.id
  vcn_id         = oci_core_vcn.vcn.id

  options {
    type                = "SearchDomain"
    search_domain_names = ["vcn03191521.oraclevcn.com"]
  }

  options {
    type        = "DomainNameServer"
    server_type = "VcnLocalPlusInternet"
  }
}

resource "oci_core_public_ip" "reserved_public_ip" {
  compartment_id = oci_identity_compartment.root.id
  lifetime       = "RESERVED"
}
