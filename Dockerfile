FROM centos

COPY app.py /opt/app.py
RUN chmod +x /opt/app.py

ENTRYPOINT ['/opt/app.py']
