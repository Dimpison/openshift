FROM centos

COPY app.py /opt/app.py
RUN chmod +x /opt/app.py

CMD ['/opt/app.py']
