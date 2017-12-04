FROM resin/rpi-raspbian
ENV GO15VENDOREXPERIMENT=1
ENV GOARCH=arm
ENV GOARM=6
RUN apt-get update && apt-get install -y build-essential
RUN apt-get install -y git
WORKDIR /
RUN git clone https://go.googlesource.com/go
WORKDIR /go/src
COPY ./go1.4 /go1.4
RUN git checkout go1.9.2
RUN GOROOT_BOOTSTRAP=/go1.4 ./all.bash