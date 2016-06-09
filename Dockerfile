FROM python:3.5.1-alpine
MAINTAINER Carl Saturnino <cosaturn@gmail.com> 

RUN \
    apk add -U build-base \
    && \
    pip install pyasn1 \
        pyOpenSSL \
        service_identity \
    #    twisted \
    && adduser -D yalih \
    && cd /home/yalih \
    #&& wget -qO- https://github.com/Masood-M/yalih/archive/master.tar.gz | tar -xz --strip-components=1 \
    && wget https://github.com/Masood-M/yalih/archive/master.tar.gz \
    #&& mv cowrie.cfg.dist cowrie.cfg \
    && chown -R yalih:yalih . \
    #&& apk del build-base \
    #    libffi-dev \
    #    openssl-dev \
    #    python-dev \
    #    tar \
    && rm -rf /var/cache/apk/*

#EXPOSE 2222

USER yalih
WORKDIR /home/yalih

#CMD ["twistd", "-n", "-l", "log/cowrie.log", "cowrie"]
