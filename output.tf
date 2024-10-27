output "buckets" {
  value = {
    for k, v in wasabi_bucket.buckets : k => v.bucket_regional_domain_name
  }
  description = "Domain names of the created buckets."
}
