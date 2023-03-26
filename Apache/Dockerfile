FROM httpd:latest
COPY ./index.html /usr/local/apache2/htdocs/
COPY ./192.168.56.1.key /usr/local/apache2/conf/server.key
COPY ./192.168.56.1.crt /usr/local/apache2/conf/server.crt
COPY ./my-httpd.conf /usr/local/apache2/conf/httpd.conf