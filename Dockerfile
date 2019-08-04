# create image build:
# docker build -t pyhttpd-image .

# create docker volume
# docker volume create pyhttpd-data

# create docker container from image with port 4040 mapping port 4040 on localhost:
# docker create -p 4040:4040 --name pyhttpd-container --mount 'type=volume,src=pyhttpd-data,dst=/root/data/' pyhttpd-image

# start docker container from image:
# docker start pyhttpd-container

# get terminal access to container or execute command inside container while running
# docker exec -t -i pyhttpd-container /bin/bash


FROM debian

EXPOSE 4040

RUN apt-get update
RUN apt-get install -y python2.7

RUN mkdir /root/data
RUN touch /root/data/test.txt

VOLUME /root/data/

COPY server.py /root/

CMD python2.7 /root/server.py
