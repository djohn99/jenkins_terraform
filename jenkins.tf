resource "aws_instance" "dav-jenkins" {
  ami                    = "${data.aws_ami.dav-jenkins.id}"
  instance_type          = "${var.dav-jenkins_instance_type}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${aws_security_group.dav-jenkins_sg.id}"]
  subnet_id              = "${element(var.vpc_private_subnets, 0)}"

  root_block_device {
    volume_type           = "gp2"
    volume_size           = 30
    delete_on_termination = false
  }

  tags = {
    Name   = "dav-jenkins"
    Author = "djohn"
    Tool   = "Terraform"
  }
}
