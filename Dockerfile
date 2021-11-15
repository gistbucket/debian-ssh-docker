FROM debian:latest

MAINTAINER gistbucket

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y \
  openssh-server git fish zsh micro nano fzf cargo python3-pip golang-go npm \
  && rm -rf /var/lib/apt/lists/*

RUN echo 'root:1766' | chpasswd

RUN mkdir /var/run/sshd

RUN mkdir /root/github_repos

RUN mkdir /root/conf_files

RUN sed 's/PermitRootLogin without-password/PermitRootLogin yes/' -i /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
