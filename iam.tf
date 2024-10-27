# Users
resource "wasabi_user" "users" {
  for_each = toset(var.users)
  name     = each.value
}

# Policies
resource "wasabi_policy" "policies_ro" {
  for_each = var.permissions.ro
  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Sid" : "ReadOnly-${title(each.key)}-Policy",
          "Effect" : "Allow",
          "Action" : [
            "s3:Get*",
            "s3:List*",
          ],
          "Resource" : values({ for k, v in each.value : k => wasabi_bucket.buckets[v].arn })
        }
      ]
    }
  )
}

resource "wasabi_policy" "policies_rw" {
  for_each = var.permissions.rw
  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Sid" : "ReadWrite-${title(each.key)}-Policy",
          "Effect" : "Allow",
          "Action" : [
            "s3:Get*",
            "s3:List*",
            "s3:PutBucket*",
            "s3:PutObject*",
            "s3:DeleteObject*"
          ],
          "Resource" : values({ for k, v in each.value : k => wasabi_bucket.buckets[v].arn })
        }
      ]
    }
  )
}

# Policies attachments
resource "wasabi_policy_attachment" "policies_ro_attachments" {
  for_each = var.permissions.ro
  name = "ro-${each.key}-pol-attach"
  policy_arn = wasabi_policy.policies_ro[each.key].arn
  users = [each.key]

  depends_on = [wasabi_user.users]
}

resource "wasabi_policy_attachment" "policies_rw_attachments" {
  for_each = var.permissions.rw
  name = "rw-${each.key}-pol-attach"
  policy_arn = wasabi_policy.policies_rw[each.key].arn
  users = [each.key]

  depends_on = [wasabi_user.users]
}
