FROM nginx

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y fcgiwrap git

RUN sed -i 's/www-data/nginx/g' /etc/init.d/fcgiwrap
RUN chown nginx:nginx /etc/init.d/fcgiwrap

COPY git.conf /etc/nginx/conf.d/default.conf

CMD /etc/init.d/fcgiwrap start && nginx -g 'daemon off;'
