<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.2, < 2.0.0 |
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | >= 4.103.0, < 5.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | 4.103.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [oci_core_boot_volume.catetral_prod_boot_volume](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_boot_volume) | resource |
| [oci_core_boot_volume.catetral_stage_boot_volume](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_boot_volume) | resource |
| [oci_core_dhcp_options.default_dhcp_options](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_dhcp_options) | resource |
| [oci_core_drg.dynamic_routing_gateway](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_drg) | resource |
| [oci_core_drg_attachment.dynamic_routing_gateway_attachment](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_drg_attachment) | resource |
| [oci_core_instance.catedral_prod](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_instance) | resource |
| [oci_core_instance.catedral_stage](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_instance) | resource |
| [oci_core_instance.master](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_instance) | resource |
| [oci_core_internet_gateway.internet_gateway](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_internet_gateway) | resource |
| [oci_core_public_ip.reserved_public_ip](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_public_ip) | resource |
| [oci_core_route_table.private_route_table](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_route_table) | resource |
| [oci_core_route_table.public_route_table](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_route_table) | resource |
| [oci_core_security_list.default_security_list](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_security_list) | resource |
| [oci_core_security_list.private_subnet_security_list](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_security_list) | resource |
| [oci_core_security_list.public_subnet_security_list](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_security_list) | resource |
| [oci_core_subnet.private](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_subnet) | resource |
| [oci_core_subnet.public](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_subnet) | resource |
| [oci_core_vcn.vcn](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_vcn) | resource |
| [oci_identity_compartment.root](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_compartment) | resource |
| [oci_core_image.ubuntu_22_04](https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/core_image) | data source |
| [oci_identity_availability_domain.availability_domain](https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/identity_availability_domain) | data source |
| [oci_identity_tenancy.root](https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/identity_tenancy) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_catedral_prod_ssh_public_key"></a> [catedral\_prod\_ssh\_public\_key](#input\_catedral\_prod\_ssh\_public\_key) | The public SSH key to use for the catedral-prod instance. | `string` | n/a | yes |
| <a name="input_catedral_stage_ssh_public_key"></a> [catedral\_stage\_ssh\_public\_key](#input\_catedral\_stage\_ssh\_public\_key) | The public SSH key to use for the catedral-stage instance. | `string` | n/a | yes |
| <a name="input_fingerprint"></a> [fingerprint](#input\_fingerprint) | The fingerprint for the user's API key. | `string` | n/a | yes |
| <a name="input_private_key"></a> [private\_key](#input\_private\_key) | The API's Private key. | `string` | `""` | no |
| <a name="input_private_key_path"></a> [private\_key\_path](#input\_private\_key\_path) | The local path to the private API key. | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | The region to deploy to. | `string` | n/a | yes |
| <a name="input_tenancy_ocid"></a> [tenancy\_ocid](#input\_tenancy\_ocid) | The OCID of the tenancy. | `string` | n/a | yes |
| <a name="input_user_ocid"></a> [user\_ocid](#input\_user\_ocid) | The OCID of the user. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->