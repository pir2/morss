FROM python:2.7-buster

WORKDIR /usr/src/app

# Install hass component dependencies
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt && \
    pip install uwsgi

# Copy source
COPY . .

WORKDIR "/morss"
USER 9000  
EXPOSE 9090

#CMD [ "python", "-m", "morss", "9090", "--theforce", "--root", "./www" ]
CMD [ "uwsgi", "--http", ":9090", "--plugin", "python", "--wi-file", "main.py", "--pyargv", "--root", "./www" ]
