FROM --platform=${BUILDPLATFORM:-linux/amd64} registry.access.redhat.com/ubi8/ubi:latest
COPY build.sh /
RUN /build.sh
RUN rm -vf /build.sh
