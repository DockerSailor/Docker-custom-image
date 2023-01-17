FROM scratch
ADD alpine-minirootfs-3.16.2-x86_64.tar.gz /
RUN apk update
RUN apk add nano
CMD ["/bin/sh"]
