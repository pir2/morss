#!/usr/bin/env python
#http://agiliq.com/blog/2014/06/minimal-gunicorn-configuration/

log-file = '-'
preload = True
max-requests = 10
max-requests-jitter = 10
bind = 'unix:/var/www/morss/morss/sock'
worker-class = 'gevent'

user='www-data'
group='www-data'
pidfile='gunicorn_pid'
accesslog='gunicorn_access.log'
errorlog='gunicorn_error.log'
