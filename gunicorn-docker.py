#!/usr/bin/env python
#http://agiliq.com/blog/2014/06/minimal-gunicorn-configuration/
preload = True
max_requests = 10
max_requests_jitter = 10
bind = "0.0.0.0:9090"
workers = 5
worker_class = 'gevent'
#user='www-data'
#group='www-data'
pidfile='gunicorn_pid'
accesslog='gunicorn_access.log'
errorlog='gunicorn_error.log'
