FROM bash:4

LABEL org.label-schema.vcs-url="https://github.com/ajmyyra/waitforit"

WORKDIR /usr/src/app

COPY wait-for-it.sh /usr/src/app/
COPY run-from-env.sh /usr/src/app/

RUN chmod +x /usr/src/app/*.sh

ENTRYPOINT ["run-from-env.sh"] 