output "Jenkins_URL" {
  value = "http://${aws_instance.dav-jenkins.public_ip}:8080"
}
