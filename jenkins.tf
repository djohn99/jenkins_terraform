resource "aws_instance" "jenkins" {
  ami                    = "${data.aws_ami.jenkins.id}"
  instance_type          = "${var.jenkins_instance_type}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${aws_security_group.jenkins_sg.id}"]
  subnet_id              = "${element(var.vpc_private_subnets, 0)}"

  root_block_device {
    volume_type           = "gp2"
    volume_size           = 30
    delete_on_termination = false
  }

  tags = {
    Name   = "jenkins"
    Author = "djohn"
    Tool   = "Terraform"
  }
}
