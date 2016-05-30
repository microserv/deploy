#!/bin/sh
docker run -d --name logbox -h logbox -p 5000/udp -p 9200:9200 sirile/minilogbox
docker run -d -e IS_KIBANA=true -p 5601 -h kibanabox --name kibanabox sirile/kibanabox http://`docker inspect --format '{{ .NetworkSettings.IPAddress }}' 'logbox'`:9200
docker run -d --name logspout -h logspout -p 8000 -v /var/run/docker.sock:/tmp/docker.sock progrium/logspout syslog://`docker inspect --format '{{ .NetworkSettings.IPAddress }}' 'logbox'`:5000
