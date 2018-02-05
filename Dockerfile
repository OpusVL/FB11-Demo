FROM quay.io/opusvl/fb11
MAINTAINER Alastair Douglas <altreus@altre.us>

ARG version
RUN if [ -z "$version" ]; then echo "No version specified"; exit 1; fi

COPY FB11-Demo-$version.tar.gz /
# Currently the [redacted] tests don't even [redacted] work
RUN cpanm -n /FB11-Demo*.tar.gz && rm /FB11-Demo*.tar.gz
RUN echo FB11::Demo@$version >> /version

COPY fb11_demo.conf /srv/fb11/fb11_demo.conf
ENV CATALYST_CONFIG /srv/fb11/fb11_demo.conf
ENV PSGI /opt/perl5/bin/fb11_demo.psgi
