provider "google" {
  credentials = file("<your_credentials_file_path>")
  project = "<your_project_name>"
  region  = "us-west-1"
}
resource "google_organization_policy" "skip_default_network_creation" {
  org_id     = "<your_org_id>"
  constraint = "constraints/compute.skipDefaultNetworkCreation"
  boolean_policy {
    enforced = true
  }
}
resource "google_organization_policy" "restrict_vm_external_ip" {
  org_id     = "<your_org_id>"
  constraint = "constraints/compute.vmExternalIpAccess"
  list_policy {
    deny {
      all = true
    }
  }
}
resource "google_organization_policy" "allow_only_policy_memebrs_domains" {
  org_id     = "<your_org_id>"
  constraint = "constraints/iam.allowedPolicyMemberDomains"
  list_policy {
    allow {
      values = ["<your_gsuite_id>"]
    } 
  }
}
resource "google_organization_policy" "restrict_source_code_download" {
  org_id     = "<your_org_id>"
  constraint = "constraints/appengine.disableCodeDownload"
  boolean_policy {
    enforced = true
  }
}
resource "google_organization_policy" "restrict_service_account_key_creation" {
  org_id     = "<your_org_id>"
  constraint = "constraints/iam.disableServiceAccountKeyCreation"
  boolean_policy {
    enforced = true
  }
}
