resource "oci_core_drg" "dynamic_routing_gateway" {
  compartment_id = oci_identity_compartment.root.id
}

resource "oci_core_drg_attachment" "dynamic_routing_gateway_attachment" {
  vcn_id = oci_core_vcn.vcn.id
  drg_id = oci_core_drg.dynamic_routing_gateway.id
}

resource "oci_core_subnet" "private" {
  vcn_id         = oci_core_vcn.vcn.id
  compartment_id = oci_identity_compartment.root.id
  cidr_block     = "10.0.13.0/24"
}

resource "oci_core_route_table" "private_route_table" {
  compartment_id = oci_identity_compartment.root.id
  vcn_id         = oci_core_vcn.vcn.id

  route_rules {
    description       = "versoza-drg-private-rule"
    network_entity_id = oci_core_drg.dynamic_routing_gateway.id
    destination       = "10.0.0.0/16"
    destination_type  = "CIDR_BLOCK"
  }
}

resource "oci_core_security_list" "private_subnet_security_list" {
  vcn_id         = oci_core_vcn.vcn.id
  compartment_id = oci_identity_compartment.root.id

  egress_security_rules {
    description      = "Oracle databases private subnets egress rule"
    destination      = "10.0.13.0/24"
    destination_type = "CIDR_BLOCK"
    protocol         = "6"
    stateless        = false

    tcp_options {
      max = 1521
      min = 1521
    }
  }

  ingress_security_rules {
    description = "Oracle databases private subnets ingress rule"
    source      = "10.0.0.0/24"
    source_type = "CIDR_BLOCK"
    protocol    = "6"
    stateless   = false

    tcp_options {
      max = 1521
      min = 1521
    }
  }
  ingress_security_rules {
    description = "Oracle databases public subnets ingress rule"
    source      = "10.0.13.0/24"
    source_type = "CIDR_BLOCK"
    protocol    = "6"
    stateless   = false

    tcp_options {
      max = 1521
      min = 1521
    }
  }
}
