FROM --platform=${BUILDPLATFORM:-linux/amd64} registry.fedoraproject.org/fedora:34

COPY /build.sh /
RUN /build.sh
RUN rm -vf /build.sh

LABEL maintainer="Major Hayden <major@mhtx.net>"
