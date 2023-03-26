FROM httpd:latest
COPY ./index.html /usr/local/apache2/htdocs/
COPY ./server.key /usr/local/apache2/conf/server.key
COPY ./server.crt /usr/local/apache2/conf/server.crt
COPY ./my-httpd.conf /usr/local/apache2/conf/httpd.conf