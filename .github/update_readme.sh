#!/bin/bash

NGINX=$(grep <package_versions.txt -E "nginx.*?-" | sed -n 1p | cut -c 7- | sed -E 's/-r.*//g')
PHP=$(grep <package_versions.txt -E "php.*?-" | sed -n 1p | cut -c 6- | sed -E 's/-r.*//g')

sed -i -E \
	-e "s/nginx-.*?-269539/nginx-${NGINX}-269539/g" \
	-e "s/php-.*?-777BB4/php-${PHP}-777BB4/g" \
	-e "s/akaunting-.*?-blue/akaunting-${APP_VERSION}-blue/g" \
	README.md
