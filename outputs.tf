output "Jenkins_URL" {
  value = "http://${aws_instance.jenkins.public_ip}:8080"
}
