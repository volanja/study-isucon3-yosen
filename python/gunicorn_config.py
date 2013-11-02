import os

#port = os.environ.get("PORT", '5000')
#bind = '0.0.0.0:' + port
bind = 'unix:/tmp/gunicorn.sock'
backlog = 2048
worker_class = 'sync'
worker_connections = 4096
max_requests = 0
timeout = 30
keepalive = 2

debug = False
spew  = False

preload_app = True
