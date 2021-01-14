#!/bin/bash

OVERLAY_VERSION=$(curl -sX GET "https://raw.githubusercontent.com/hydazz/docker-baseimage-alpine/main/version_info.json" | jq -r .overlay_version)
NGINX_VERSION=$(grep <package_versions.txt -E "nginx.*?-" | sed -n 1p | cut -c 7- | sed -E 's/-r.*//g')
PHP_VERSION=$(grep <package_versions.txt -E "php.*?-" | sed -n 1p | cut -c 6- | sed -E 's/-r.*//g')

OLD_OVERLAY_VERSION=$(jq <version_info.json -r .overlay_version)
OLD_NGINX_VERSION=$(jq <version_info.json -r .nginx_version)
OLD_PHP_VERSION=$(jq <version_info.json -r .php_version)
OLD_AKAUNTING_RELEASE=$(jq <version_info.json -r .akaunting_release)

sed -i \
	-e "s/${OLD_OVERLAY_VERSION}/${OVERLAY_VERSION}/g" \
	-e "s/${OLD_NGINX_VERSION}/${NGINX_VERSION}/g" \
	-e "s/${OLD_PHP_VERSION}/${PHP_VERSION}/g" \
	-e "s/${OLD_AKAUNTING_RELEASE}/${AKAUNTING_RELEASE}/g" \
	README.md

NEW_VERSION_INFO="overlay_version|nginx_version|php_version|akaunting_release
${OVERLAY_VERSION}|${NGINX_VERSION}|${PHP_VERSION}|${AKAUNTING_RELEASE}"

jq -Rn '
( input  | split("|") ) as $keys |
( inputs | split("|") ) as $vals |
[[$keys, $vals] | transpose[] | {key:.[0],value:.[1]}] | from_entries
' <<<"$NEW_VERSION_INFO" >version_info.json
