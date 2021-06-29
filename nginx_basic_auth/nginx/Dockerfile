FROM nginx:latest

COPY nginx.conf /etc/nginx
COPY default.conf /etc/nginx/conf.d
COPY create_htpasswd.sh /etc/nginx

RUN apt-get update
RUN apt-get install -y openssl
RUN chmod 755 /etc/nginx/create_htpasswd.sh
RUN /etc/nginx/create_htpasswd.sh
RUN chmod 444 /etc/nginx/.htpasswd
