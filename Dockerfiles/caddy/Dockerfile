FROM ailispaw/barge

ENV CADDY_SITE     https://caddyserver.com/download/build
ENV CADDY_FEATURES git,hugo,ipfilter

RUN wget -qO- "${CADDY_SITE}?os=linux&arch=amd64&features=${CADDY_FEATURES}" \
      | tar --no-same-owner -C /usr/bin/ -xz caddy

WORKDIR /var/www/html

VOLUME [ "/var/www/html" ]

EXPOSE 80 443 2015

CMD [ "caddy" ]
