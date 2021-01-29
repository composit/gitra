FROM alpine:3

RUN apk add openssh --no-cache

RUN adduser -D gitra
RUN passwd -d gitra

RUN sed -i "s|#PasswordAuthentication yes|PasswordAuthentication no|g" /etc/ssh/sshd_config

COPY entrypoint.sh /entrypoint.sh

EXPOSE 22
ENTRYPOINT ["/entrypoint.sh"]
