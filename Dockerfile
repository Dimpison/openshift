FROM centos

LABEL io.openshift.build.source-location="https://github.com/Dimpison/openshift.git" \
      io.openshift.build.namespace="cdp1"

COPY app.py /opt/app.py
RUN chmod +x /opt/app.py

CMD ["/opt/app.py"]
