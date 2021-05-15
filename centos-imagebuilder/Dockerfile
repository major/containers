FROM --platform=${BUILDPLATFORM:-linux/amd64} quay.io/centos/centos:stream8

COPY /build.sh /
RUN /build.sh
RUN rm -vf /build.sh

LABEL maintainer="Major Hayden <major@mhtx.net>"
LABEL source="https://github.com/major/containers"

CMD ['/sbin/init']