FROM jlesage/baseimage-gui:ubuntu-16.04
LABEL maintainer="Ralph Keegstra ralph@keegstra.eu"

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install software-properties-common && \
    apt-add-repository ppa:kdenlive/kdenlive-stable && \
    apt-get update && \
    apt-get -y install dbus-x11 kdenlive

RUN echo "#!/bin/sh\nHOME=/config\n$(dbus-launch)\nexec /usr/bin/kdenlive" > /startapp.sh
#RUN echo "#!/bin/sh\nexec /usr/bin/kdenlive" > /startapp.sh
#RUN apt-get -y install xterm
#RUN echo "#!/bin/sh\n\nexec /usr/bin/xterm" > /startapp.sh

ENV APP_NAME="kdenlive"

