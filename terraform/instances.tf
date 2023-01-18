resource "oci_core_instance" "catedral_prod" {
  display_name = "catedral-prod"

  compartment_id      = oci_identity_compartment.root.id
  availability_domain = data.oci_identity_availability_domain.availability_domain.name

  shape = "VM.Standard.E2.1.Micro"

  metadata = {
    "ssh_authorized_keys" : var.catedral_prod_ssh_public_key
  }
}

resource "oci_core_boot_volume" "catetral_prod_boot_volume" {
  display_name = "catedral-prod (Boot Volume)"

  availability_domain = data.oci_identity_availability_domain.availability_domain.name
  compartment_id      = oci_identity_compartment.root.id

  size_in_gbs = 47
  vpus_per_gb = 10

  is_auto_tune_enabled = false

  source_details {
    id   = "ocid1.bootvolume.oc1.sa-saopaulo-1.abtxeljrhaoz2wdp5csus67fjtnwzwfgjq6uv2biycvnhjqhugon7chss7ia"
    type = "bootVolume"
  }

  lifecycle {
    ignore_changes = [
      source_details
    ]
  }
}

resource "oci_core_instance" "catedral_stage" {
  display_name = "catedral-stage"

  compartment_id      = oci_identity_compartment.root.id
  availability_domain = data.oci_identity_availability_domain.availability_domain.name

  shape = "VM.Standard.E2.1.Micro"

  metadata = {
    "ssh_authorized_keys" : var.catedral_stage_ssh_public_key
  }
}

resource "oci_core_boot_volume" "catetral_stage_boot_volume" {
  display_name = "catedral-stage (Boot Volume)"

  availability_domain = data.oci_identity_availability_domain.availability_domain.name
  compartment_id      = oci_identity_compartment.root.id

  size_in_gbs = 47
  vpus_per_gb = 10

  is_auto_tune_enabled = false

  source_details {
    id   = "ocid1.bootvolume.oc1.sa-saopaulo-1.abtxeljrcoe6xwkgw5ejfofyflstopo54vr4nz3sbpccoodvitjxgmhbblbq"
    type = "bootVolume"
  }

  lifecycle {
    ignore_changes = [
      source_details
    ]
  }
}

resource "oci_core_instance" "main" {
  compartment_id      = oci_identity_compartment.root.id
  availability_domain = data.oci_identity_availability_domain.availability_domain.name

  display_name = "master-${data.oci_identity_tenancy.root.name}"
  shape        = "VM.Standard.A1.Flex"

  shape_config {
    ocpus         = 4
    memory_in_gbs = 24
  }

  create_vnic_details {
    subnet_id        = oci_core_subnet.private.id
    assign_public_ip = true
  }

  source_details {
    source_id   = data.oci_core_image.ubuntu_22_04.id
    source_type = "image"
  }

  metadata = {
    "ssh_authorized_keys" : var.catedral_prod_ssh_public_key
  }
}

data "oci_core_image" "ubuntu_22_04" {
  image_id = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaaregfux63u3c3u75f3sfegclcgbyfwqpprwzja7t3d43zstumybpa"
}
