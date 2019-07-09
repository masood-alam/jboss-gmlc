#!/bin/bash
./stop.sh
#docker run -it --name jboss-gmlc --net mynet18 --ip 172.18.0.3 jboss-gmlc
#docker run -it --name jboss-gmlc -p 3020:3020 -p 9080:8080 -v /home/masood/docker/jboss-gmlc/data:/opt/jboss-5.1.0.GA/server/default/data jboss-gmlc

docker run --name jboss-gmlc --net mynet18 --ip 172.18.0.3 -v /home/masood/docker/jboss-gmlc/host18-data:/opt/jboss-5.1.0.GA/server/default/data -v /home/masood/docker/jboss-gmlc/host18-data:/opt/jboss-5.1.0.GA/server/default/log -d jboss-gmlc


# use this command to grab the physical ip of host
#docker run -it --name jboss-gmlc --network=host -p 2905:2905 -p 9080:8080 -v /root/ufone_lbs/gmlc/data:/opt/jboss-5.1.0.GA/server/default/data jboss-gmlc


