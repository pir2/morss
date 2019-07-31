FROM python:2.7-buster

WORKDIR /usr/src/app

# Install hass component dependencies
COPY requirements.txt requirements.txt
COPY www/index.html index.html
RUN pip install --no-cache-dir -r requirements.txt && \
    pip install --no-cache-dir uwsgi && \
    pip install --no-cache-dir gunicorn gevent
# Copy source
COPY . .

EXPOSE 9090

#CMD [ "python", "-m", "morss", "9090", "--theforce", "--root", "./www" ]
CMD [ "uwsgi", \
    "--http", ":9090", \
    "--wsgi-file", "main.py", \
    "--pyargv", "--proxy", "--root", "./www/" \
    ]

#CMD [ "gunicorn", \
#       "-w=5", \
#       "main:application", \
#       "--preload", \ 
#       "--worker-class=gevent", \
#       "--max-requests=10", \
#       "--max-requests-jitter=10", \
#       "--bind=0.0.0.0:9090"]
    
