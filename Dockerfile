FROM centos
MAINTAINER dmytro_kabachenko@epam.com

LABEL io.k8s.description="Simple Python server" \
      io.k8s.display-name="Python" \
      io.openshift.s2i.destination="/opt/dima" \
      io.openshift.s2i.scripts-url=image:///usr/local/s2i

COPY ./s2i_scripts/ /usr/local/s2i

RUN adduser --system -u 10001 dima
RUN mkdir -p /opt/dima && chown -R dima: /opt/dima
RUN chown -R dima: /usr/local/s2i && chmod +x /usr/local/s2i/*

USER 10001
EXPOSE 8000

CMD ["/usr/local/s2i/usage"]
