## docker-akaunting

[![docker hub](https://img.shields.io/badge/docker_hub-link-blue?style=for-the-badge&logo=docker)](https://hub.docker.com/r/vcxpz/akaunting) ![docker image size](https://img.shields.io/docker/image-size/vcxpz/akaunting?style=for-the-badge&logo=docker) [![auto build](https://img.shields.io/badge/docker_builds-automated-blue?style=for-the-badge&logo=docker?color=d1aa67)](https://github.com/hydazz/docker-akaunting/actions?query=workflow%3A"Auto+Builder+CI") [![codacy branch grade](https://img.shields.io/codacy/grade/89e8560e0dc443c2a484585876ab3a98/main?style=for-the-badge&logo=codacy)](https://app.codacy.com/gh/hydazz/docker-akaunting)

[Akaunting](https://akaunting.com/) is a free, open source and online accounting software designed for small businesses and freelancers. It is built with modern technologies such as Laravel, VueJS, Bootstrap 4, RESTful API etc. Thanks to its modular structure, Akaunting provides an awesome App Store for users and developers.

## Initial Setup

Setting up Akaunting is extremely simple, [here's](https://akaunting.com/docs/installation) the official 3 step picture setup from Akaunting. **A MySQL server is required**

## Usage

    docker run -d \
      --name=akaunting \
      -e PUID=1000 \
      -e PGID=1000 \
      -e TZ=Australia/Melbourne \
      -p 443:443 \
      -p 80:80 \
      -v <path to appdata>:/config \
      --restart unless-stopped \
      vcxpz/akaunting

[![template](https://img.shields.io/badge/unraid_template-ff8c2f?style=for-the-badge&logo=docker?color=d1aa67)](https://github.com/hydazz/docker-templates/blob/main/hydaz/akaunting.xml)

## Upgrading Akaunting

When you first start this image it downloads the Akaunting version listed in [version information](#version-information) (Should be the latest version). If a new version of Akaunting is released, [follow these steps](https://akaunting.com/docs/update) to _manually_ upgrade Akaunting. Pulling an updated version of this image **does not** _automatically_ upgrade Akaunting.

## Fixing Appdata Permissions

If you ever accidentally screw up the permissions on the appdata folder, run fix-perms within the container. This will restore most of the files/folders with the correct permissions.
