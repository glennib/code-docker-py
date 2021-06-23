FROM ubuntu:18.04

RUN apt-get update \
  && apt-get install -y ssh \
    rsync \
    tar \
    python3 \
    python3-pip \
  && apt-get clean

RUN ( \
    echo 'LogLevel DEBUG2'; \
    echo 'PermitRootLogin yes'; \
    echo 'PasswordAuthentication yes'; \
    echo 'Subsystem sftp /usr/lib/openssh/sftp-server'; \
  ) > /etc/ssh/sshd_config_cppdev \
  && mkdir /run/sshd

RUN yes password | passwd root

RUN usermod -s /bin/bash root

COPY ./requirements.txt /etc/requirements.txt

RUN pip3 install -r /etc/requirements.txt

CMD ["/usr/sbin/sshd", "-D", "-e", "-f", "/etc/ssh/sshd_config_cppdev"]
