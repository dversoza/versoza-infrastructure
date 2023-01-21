resource "cloudflare_record" "dns" {
  for_each = { for record in var.cloudflare_dns_records : record.name => record }
  zone_id  = var.cloudflare_zone_id

  name    = each.value.name
  comment = each.value.comment
  type    = each.value.type
  value   = each.value.value
  ttl     = each.value.ttl
  proxied = each.value.proxied == null ? true : each.value.proxied
}
