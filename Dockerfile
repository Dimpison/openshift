FROM centos:latest
MAINTAINER Serhii_Levchenko@epam.com

RUN yum install -y python-flask python-gunicorn && yum -y clean all

LABEL io.k8s.description="Dummy Platform for building and running Python Flask applications" \
      io.k8s.display-name="Python" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,python" \
      io.openshift.s2i.destination="/opt/app" \
      io.openshift.s2i.scripts-url=image:///usr/local/s2i

RUN mkdir -p /opt/app

COPY ./S2iScripts/ /usr/local/s2i

EXPOSE 8080

CMD ["/usr/local/s2i/usage"]

