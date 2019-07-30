FROM python:2.7-buster

WORKDIR /usr/src/app

# Install hass component dependencies
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy source
COPY . .

EXPOSE 9090

CMD [ "python", "-m", "morss", "9090", "--theforce", "--root", "./www" ]
