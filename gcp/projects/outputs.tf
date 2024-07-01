output "jenkins_ip" {
  description = "The external IP address of the Jenkins instance"
  value       = google_compute_instance.jenkins.network_interface[0].access_config[0].nat_ip
}
