FROM vanandelinstitute/systemdcentos
RUN yum update -y
RUN yum install -y vim curl unzip wget sssd-client

