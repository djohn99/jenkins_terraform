FROM hashicorp/packer:1.5.4

LABEL "com.github.actions.name" = "Packer build"
LABEL "com.github.actions.description" = "Run packer build on a template file"
LABEL "com.github.actions.icon"="dav"
LABEL "com.github.actions.color"="blue"

LABEL "repository" = "https://github.com/djohn99/jenkins_terraform"
LABEL "homepage" = "https://github.com/djohn99/jenkins_terraform"
LABEL "maintainer" = "David John <david.ojaigho@gmail.com>"

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]