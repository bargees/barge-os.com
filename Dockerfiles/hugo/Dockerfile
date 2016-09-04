FROM ailispaw/barge

ENV HUGO_VERSION 0.16
ENV HUGO_BINARY  hugo_${HUGO_VERSION}_linux-64bit
ENV HUGO_SITE    https://github.com/spf13/hugo/releases/download

RUN wget -qO- ${HUGO_SITE}/v${HUGO_VERSION}/${HUGO_BINARY}.tgz | tar xz -C /usr/bin ./hugo

WORKDIR /src

VOLUME [ "/src", "/public" ]

ENTRYPOINT [ "hugo" ]

EXPOSE 1313
