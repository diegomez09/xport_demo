FROM httpd:2.4

RUN apt-get update -y && apt-get install  -y git
COPY ./index.html /usr/local/apache2/htdocs/index.html
WORKDIR /usr/local/apache2/htdocs/

