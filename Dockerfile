FROM python:2.7-buster

RUN groupadd -r morss && useradd --no-log-init -r -g morss morss

WORKDIR /usr/src/app

# Install hass component dependencies
COPY requirements.txt requirements.txt
COPY www/index.html index.html
RUN pip install --user morss --no-cache-dir -r requirements.txt && \
    pip install --user morss --no-cache-dir uwsgi && \
    pip install --user morss --no-cache-dir gunicorn gevent
# Copy source
COPY . .

EXPOSE 9090

CMD [ "gunicorn", \
      "-c=gunicorn-docker.py", \
      "main:application" \
      ]

#CMD [ "python", "-m", "morss", "9090", "--theforce", "--root", "./www" ]
#CMD [ "uwsgi", \
#    "--http", ":9090", \
#    "--process=4", \
#    "--wsgi-file", "main.py", \
#    "--pyargv='proxy --root ./www/'" \
#    ]

#CMD [ "gunicorn", \
#       "-w=5", \
#       "main:application", \
#       "--preload", \ 
#       "--worker-class=gevent", \
#       "--max-requests=10", \
#       "--max-requests-jitter=10", \
#       "--bind=0.0.0.0:9090"]
    
