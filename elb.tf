// Jenkins ELB
resource "aws_elb" "jenkins_elb" {
  subnets                   = ["subnet-0c0c2f9dff155fe46"]
  cross_zone_load_balancing = true
  security_groups           = ["${aws_security_group.elb_jenkins_sg.id}"]
  instances                 = ["${aws_instance.jenkins.id}"]

  listener {
    instance_port      = 8080
    instance_protocol  = "http"
    lb_port            = 80
    lb_protocol        = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:8080"
    interval            = 5
  }

  tags = {
    Name   = "jenkins_elb"
    Author = "djohn"
    Tool   = "Terraform"
  }
}
