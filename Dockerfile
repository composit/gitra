FROM alpine:3

RUN apk add openssh --no-cache

RUN adduser -D matt
RUN passwd -d matt

RUN sed -i "s|#PasswordAuthentication yes|PasswordAuthentication no|g" /etc/ssh/sshd_config
RUN sed -i "s|#Port 22|Port 443|g" /etc/ssh/sshd_config

COPY entrypoint.sh /entrypoint.sh

EXPOSE 443
ENTRYPOINT ["/entrypoint.sh"]
