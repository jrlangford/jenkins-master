FROM jenkinsci/jenkins:lts-alpine

USER root

RUN apk -U add docker shadow sudo

RUN addgroup sudo && usermod -aG sudo jenkins

RUN install-plugins.sh workflow-job:2.11 antisamy-markup-formatter matrix-auth blueocean:1.1.5

COPY sudoers /etc/sudoers
COPY .bashrc /var/jenkins_home/.bashrc

USER jenkins
