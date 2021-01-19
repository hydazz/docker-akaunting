#!/bin/bash

NGINX=$(grep <package_versions.txt -E "nginx.*?-" | sed -n 1p | cut -c 7- | sed -E 's/-r.*//g')
PHP=$(grep <package_versions.txt -E "php.*?-" | sed -n 1p | cut -c 6- | sed -E 's/-r.*//g')

echo "## docker-akaunting

[![docker hub](https://img.shields.io/badge/docker_hub-link-blue?style=for-the-badge&logo=docker)](https://hub.docker.com/r/vcxpz/akaunting) ![docker image size](https://img.shields.io/docker/image-size/vcxpz/akaunting?style=for-the-badge&logo=docker) [![auto build](https://img.shields.io/badge/docker_builds-automated-blue?style=for-the-badge&logo=docker?color=d1aa67)](https://github.com/hydazz/docker-akaunting/actions?query=workflow%3A\"Auto+Builder+CI\") [![codacy branch grade](https://img.shields.io/codacy/grade/89e8560e0dc443c2a484585876ab3a98/main?style=for-the-badge&logo=codacy)](https://app.codacy.com/gh/hydazz/docker-akaunting)

[Akaunting](https://akaunting.com/) is a free, open source and online accounting software designed for small businesses and freelancers. It is built with modern technologies such as Laravel, VueJS, Bootstrap 4, RESTful API etc. Thanks to its modular structure, Akaunting provides an awesome App Store for users and developers.

## Initial Setup

Setting up Akaunting is extremely simple, [here's](https://akaunting.com/docs/installation) the official 3 step picture setup from Akaunting. **A MySQL server is required**

## Version Information

![alpine](https://img.shields.io/badge/alpine-edge-0D597F?style=for-the-badge&logo=alpine-linux) ![nginx](https://img.shields.io/badge/nginx-${NGINX}-269539?style=for-the-badge&logo=nginx) ![php](https://img.shields.io/badge/php-${PHP}-777BB4?style=for-the-badge&logo=php) ![akaunting](https://img.shields.io/badge/akaunting-${APP_VERSION}-blue?style=for-the-badge)

See [package_versions.txt](package_versions.txt) for a full list of the packages and package versions used in this image

## Usage

    docker run -d \\
      --name=akaunting \\
      -e PUID=1000 \\
      -e PGID=1000 \\
      -e TZ=Australia/Melbourne \\
      -p 443:443 \\
      -p 80:80 \\
      -v <path to appdata>:/config \\
      --restart unless-stopped \\
      vcxpz/akaunting

[![template](https://img.shields.io/badge/unraid_template-ff8c2f?style=for-the-badge&logo=docker?color=d1aa67)](https://github.com/hydazz/docker-templates/blob/main/hydaz/akaunting.xml)

## Upgrading Akaunting

When you first start this image it downloads the Akaunting version listed in [version information](#version-information) (Should be the latest version). If a new version of Akaunting is released, [follow these steps](https://akaunting.com/docs/update) to _manually_ upgrade Akaunting. Pulling an updated version of this image **does not** _automatically_ upgrade Akaunting." >README.md
