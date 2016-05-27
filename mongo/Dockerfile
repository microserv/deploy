FROM localhost:5000/backend-comm-mongo
MAINTAINER Pål Karlsrud <paal@128.no>

RUN apk add --update curl
RUN curl -o /etc/supervisor.d/mongodb.ini https://128.no/f/mongodb.ini

RUN rm -rf /run && mkdir -p /run
ENV SERVICE_NAME mongodb
