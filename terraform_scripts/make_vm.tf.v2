# This code is compatible with Terraform 4.25.0 and versions that are backwards compatible to 4.25.0.
# For information about validating this Terraform code, see https://developer.hashicorp.com/terraform/tutorials/gcp-get-started/google-cloud-platform-build#format-and-validate-the-configuration
provider "google" {
  credentials = file("/Users/peterholm/hardy-clover-324620-a7ebee7e97ea.json")
  project     = "hardy-clover-324620"
  region      = "us-central1"
  zone        = "us-central1-a"
}
resource "google_compute_instance" "gem5sim" {
  metadata = {
    startup-script = "#!/bin/bash\nwget -O - https://github.com/peterdholm/gem5sim/blob/21ede8b6854430df370e7176382c265b5e5faca8/terraform_scripts/remote_install.sh | bash"
  }
  boot_disk {
    auto_delete = true
    device_name = "gem5sim"

    initialize_params {
      image = "projects/debian-cloud/global/images/debian-11-bullseye-v20230615"
      size  = 10
      type  = "pd-balanced"
    }

    mode = "READ_WRITE"
  }

  can_ip_forward      = false
  deletion_protection = false
  enable_display      = false

  labels = {
    goog-ec-src = "vm_add-tf"
  }

  machine_type = "n2d-standard-2"
  name         = "gem5sim"

  network_interface {
    access_config {
      network_tier = "PREMIUM"
    }

    subnetwork = "projects/hardy-clover-324620/regions/us-central1/subnetworks/default"
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    preemptible         = false
    provisioning_model  = "STANDARD"
  }

  service_account {
    email  = "339356615405-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }

  zone = "us-central1-a"
}

