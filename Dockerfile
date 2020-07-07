# Build as
# docker build -t motuz_app:latest -f docker/app/Dockerfile .

FROM vanadnelinstitute:systemdcentos
RUN yum update -y
RUN yum install -y vim curl unzip wget krb5-user libpam-krb5 sudo

