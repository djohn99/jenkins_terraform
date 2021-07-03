# Security Group:
resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins_sg"
  description = "Jenkins Server: created by Terraform for [dev]"

  # legacy name of VPC ID
  vpc_id = "${var.vpc_id}"

  tags = {
    Name = "jenkins"
    env  = "dev"
  }
}

###############################################################################
# ALL INBOUND
###############################################################################

# ssh
resource "aws_security_group_rule" "jenkins_from_source_ingress_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = "${aws_security_group.jenkins_sg.id}"
  cidr_blocks       = ["0.0.0.0/0", "172.31.0.0/16"]
  description       = "ssh to jenkins_sg"
}

# web
resource "aws_security_group_rule" "jenkins_from_source_ingress_webui" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = "${aws_security_group.jenkins_sg.id}"
  cidr_blocks       = ["0.0.0.0/0", "172.31.0.0/16"]
  description       = "jenkins web"
}



###############################################################################
# ALL OUTBOUND
###############################################################################

resource "aws_security_group_rule" "jenkins_to_other_machines_ssh" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = "${aws_security_group.jenkins_sg.id}"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "allow jenkins master to ssh to other machines"
}

resource "aws_security_group" "elb_jenkins_sg" {
  name        = "elb_jenkins_sg"
  description = "Allow https traffic"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name   = "elb_jenkins_sg"
    Author = "djohn"
    Tool   = "Terraform"
  }
}
