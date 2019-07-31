FROM python:2.7-buster

WORKDIR /usr/src/app

# Install hass component dependencies
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt && \
    pip install uwsgi && \
    pip install gunicorn gevent
# Copy source
COPY . .

EXPOSE 9090

#CMD [ "python", "-m", "morss", "9090", "--theforce", "--root", "./www" ]
#CMD [ "uwsgi", \
#    "--http", ":9090", \
#    "--wsgi-file", "main.py", \
#    "--pyargv", "--root ./www/"\
#    ]
gunicorn -c gunicorn-config.py main:application
CMD ["gunicorn", \
    "-c gunicorn-docker.py", \
    "main:application" \
    ]
    
