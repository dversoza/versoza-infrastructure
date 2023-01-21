data "oci_objectstorage_namespace" "objectstorage_namespace" {
  compartment_id = oci_identity_compartment.root.id
}

resource "oci_objectstorage_bucket" "static_assets" {
  name           = "static-assets"
  compartment_id = oci_identity_compartment.root.id
  namespace      = data.oci_objectstorage_namespace.objectstorage_namespace.namespace

  access_type = "ObjectReadWithoutList"
}
