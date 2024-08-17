FROM ubuntu

RUN apt update && \
  DEBAIAN_FRONTEND=noninteractive apt install -y openssh-server && \
  rm -rf /var/lib/apt/lists

RUN mkdir -p /var/run/sshd

RUN update-rc.d ssh enable

RUN useradd -m -s /bin/bash majid && echo "majid:majid" | chpasswd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
