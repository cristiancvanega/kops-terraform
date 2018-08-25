FROM hashicorp/terraform:light

ENV WORKDIR=/usr/src/app

WORKDIR ${WORKDIR}

ADD . ${WORKDIR}

COPY bin/entrypoint /usr/local/bin/entrypoint

ENTRYPOINT ["entrypoint"]
