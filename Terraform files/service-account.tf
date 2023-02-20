resource "google_service_account" "sa" {
  count = length(var.accounts)
  account_id   = var.accounts[count.index]
}
resource "google_project_iam_member" "sa-with-roles" {
  count = length(var.roles)
  project = var.project_id
  role    = var.roles[count.index] 
  member  = "serviceAccount:${google_service_account.sa[count.index].email}"
}