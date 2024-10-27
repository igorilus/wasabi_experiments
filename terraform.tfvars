# Departments
departments = ["engineering", "finance", "marketing", "operations", "sales"]

# Users
users = ["alice", "bob", "charlie", "backup"]

# Permissions
permissions = {
  ro = {
    alice   = ["engineering"],
    backup  = ["engineering", "finance", "marketing", "operations", "sales"],
    charlie = ["finance"],
  },
  rw = {
    alice   = ["marketing", "sales"],
    bob     = ["engineering", "finance", "marketing", "operations", "sales"],
    charlie = ["operations"],
  }
}
