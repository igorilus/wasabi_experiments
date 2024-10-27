resource "wasabi_bucket" "buckets" {
  for_each = toset(var.departments)
  bucket   = "${each.value}-bucket-${var.suffix}"
}
