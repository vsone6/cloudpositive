credentials_file = "keys.json"
project_id       = "vishnuplayground"
region           = "us-central1"
zone             = "us-central1-a"
instance_name    = "terraform-instance"
image = "debian-cloud/debian-11"
instance_config = {
  "web"     = "e2-medium"
  "backend" = "e2-medium"
  "login"   = "e2-small"
}
