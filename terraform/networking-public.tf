resource "oci_core_internet_gateway" "internet_gateway" {
  compartment_id = oci_identity_compartment.root.id
  vcn_id         = oci_core_vcn.vcn.id
}

resource "oci_core_subnet" "public" {
  vcn_id         = oci_core_vcn.vcn.id
  compartment_id = oci_identity_compartment.root.id
  cidr_block     = "10.0.0.0/24"
}

resource "oci_core_route_table" "public_route_table" {
  compartment_id = oci_identity_compartment.root.id
  vcn_id         = oci_core_vcn.vcn.id

  route_rules {
    network_entity_id = oci_core_internet_gateway.internet_gateway.id
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
  }
}

resource "oci_core_security_list" "default_security_list" {
  vcn_id         = oci_core_vcn.vcn.id
  compartment_id = oci_identity_compartment.root.id

  egress_security_rules {
    description      = "Allow all internal egress trafic"
    destination      = "10.0.0.0/16"
    destination_type = "CIDR_BLOCK"
    protocol         = "6"
    stateless        = false
  }

  ingress_security_rules {
    description = "Allow all internal ingress trafic"
    source      = "10.0.0.0/16"
    source_type = "CIDR_BLOCK"
    protocol    = "6"
    stateless   = false
  }
}

resource "oci_core_security_list" "public_subnet_security_list" {
  vcn_id         = oci_core_vcn.vcn.id
  compartment_id = oci_identity_compartment.root.id

  egress_security_rules {
    description      = "Allow all egress"
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    protocol         = "6"
    stateless        = false
  }
  egress_security_rules {
    description      = "Oracle databases public subnet egress rule"
    destination      = "10.0.13.0/24"
    destination_type = "CIDR_BLOCK"
    protocol         = "all"
    stateless        = false
  }

  ingress_security_rules {
    protocol    = "6"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = false

    tcp_options {
      max = 22
      min = 22
    }
  }
  ingress_security_rules {
    description = "Allow all HTTP"
    protocol    = "6"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = false

    tcp_options {
      max = 80
      min = 80
    }
  }
  ingress_security_rules {
    description = "Allow all HTTPS"
    protocol    = "6"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = false

    tcp_options {
      max = 443
      min = 443
    }
  }
}
