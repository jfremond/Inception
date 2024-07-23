# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    wp_setup.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jfremond <jfremond@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/01 02:44:25 by jfremond          #+#    #+#              #
#    Updated: 2024/07/22 19:00:20 by jfremond         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

sleep 10

set -x

mv wp-cli.phar wordpress
cd wordpress

echo "Installing..."

# Generate a wp-config file
# --allow-root	=> run wp-cli as root
# --dbname		=> database name
# --dbuser		=> database name
# --dbpass		=> database password
# --dbhost		=> database host
# --path		=> where is WordPress installed
if [ ! -f /var/www/wordpress/wp-config.php ]; then
	php83 wp-cli.phar config create \
		--allow-root \
		--dbname=$DB_NAME \
		--dbuser=$DB_USER_NAME \
		--dbpass=$DB_USER_PASS \
		--dbhost=mariadb:3306 \
		--path='/var/www/wordpress'

# Create a new database with the informations given above
	php83 wp-cli.phar db create

# Run the standard WordPress installation process
# --allow-root		=> run wp-cli as root
# --url				=> the domain name for the site
# --title			=> the title of the site
# --admin_user		=> the admin username
# --admin_password	=> the admin password
# --admin_email		=> the admin email
# --path			=> where is WordPress installed
	php83 wp-cli.phar core install \
		--allow-root \
		--url=$DOMAIN_NAME \
		--title=$SITE_TITLE \
		--admin_user=$WP_ADMIN_NAME \
		--admin_password=$WP_ADMIN_PASS \
		--admin_email=$WP_ADMIN_MAIL \
		--path='/var/www/wordpress'

# Create a new user
# --allow-root	=> run wp-cli as root
# --role=author	=> to specify the author role
# --user_pass	=> the author password
# --path		=> where is WordPress installed
	php83 wp-cli.phar user create \
		--allow-root \
		--role=author $WP_USER_NAME $WP_USER_MAIL \
		--user_pass=$WP_USER_PASS \
		--path='/var/www/wordpress'
fi

# Run PHP-FPM in foreground
# exec /usr/sbin/php-fpm83 -F
exec "$@"
