# Download baseImage
FROM alpine:3.19

WORKDIR /var/www

# Update and upgrade alpine
# Install wget, PHP and its dependencies
# Install MariaDB client
# Download and install wordpress
# Change where PHP-FPM is listening
# Install wordpress CLI
# Make it executable
RUN apk add --no-cache php83-phar &&\
	apk add --no-cache php83-mysqli &&\
	apk add --no-cache php83-fpm &&\
	apk add --no-cache php83-iconv &&\
	apk add --no-cache mariadb-client &&\
	wget https://wordpress.org/wordpress-6.5.5.tar.gz &&\
	tar -xzf wordpress-6.5.5.tar.gz && rm wordpress-6.5.5.tar.gz &&\
	sed -i 's/127.0.0.1:9000/wordpress:9000/' /etc/php83/php-fpm.d/www.conf &&\
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar\
	&& chmod +x wp-cli.phar

# Copy script
COPY ./tools/wp_setup.sh wp_setup.sh

# Execute script
ENTRYPOINT [ "sh", "wp_setup.sh" ]
CMD [ "/usr/sbin/php-fpm83", "-F" ]
