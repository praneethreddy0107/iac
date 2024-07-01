

resource "google_compute_instance" "jenkins" {
  name         = "jenkins-instance"
  machine_type = "e2-medium"
  zone         = var.zone
  project=var.project_id

  tags = ["http-server"]
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
metadata = {
    startup-script = <<-EOF
      #!/bin/bash
      # Update package lists
      sudo apt update

      # Install Java (Jenkins requires Java to run)
      sudo apt install -y openjdk-11-jdk

      # Add the Jenkins repository key to the system
      curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee \
          /usr/share/keyrings/jenkins-keyring.asc > /dev/null

      # Add the Jenkins Debian repository
      echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
          https://pkg.jenkins.io/debian binary/ | sudo tee \
          /etc/apt/sources.list.d/jenkins.list > /dev/null

      # Update package lists again to include the Jenkins repository
      sudo apt update

      # Install Jenkins
      sudo apt install -y jenkins

      # Start the Jenkins service
      sudo systemctl start jenkins

      
    EOF
    }

}
