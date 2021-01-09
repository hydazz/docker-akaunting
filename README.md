## docker-akaunting
[![docker hub](https://img.shields.io/badge/docker_hub-link-blue?style=for-the-badge&logo=docker)](https://hub.docker.com/repository/docker/vcxpz/akaunting) ![docker image size](https://img.shields.io/docker/image-size/vcxpz/akaunting?style=for-the-badge&logo=docker) [![auto build](https://img.shields.io/badge/docker_builds-automated-blue?style=for-the-badge&logo=docker?color=d1aa67)](https://github.com/hydazz/docker-akaunting/actions?query=workflow%3A"Auto+Builder+CI")

[Akaunting](https://akaunting.com/) is a free, open source and online accounting software designed for small businesses and freelancers. It is built with modern technologies such as Laravel, VueJS, Bootstrap 4, RESTful API etc. Thanks to its modular structure, Akaunting provides an awesome App Store for users and developers.

## Version Information
![alpine](https://img.shields.io/badge/alpine-edge-0D597F?style=for-the-badge&logo=alpine-linux) ![s6 overlay](https://img.shields.io/badge/s6_overlay-2.1.0.2-blue?style=for-the-badge) ![nginx](https://img.shields.io/badge/nginx-1.18.0-269539?style=for-the-badge&logo=nginx) ![php](https://img.shields.io/badge/php-7.4.13-777BB4?style=for-the-badge&logo=php) ![akaunting](https://img.shields.io/badge/akaunting-2.0.26-blue?style=for-the-badge)

**[See here for a list of packages](https://github.com/hydazz/docker-akaunting/blob/main/package_versions.txt)**

## Usage
```
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
```
[![template](https://img.shields.io/badge/unraid_template-ff8c2f?style=for-the-badge&logo=docker?color=d1aa67)](https://github.com/hydazz/docker-templates/blob/main/hydaz/akaunting.xml)

## Upgrading Akaunting
When you first start this image it downloads the Akaunting version listed in [Version information](https://github.com/hydazz/docker-akaunting#version-information) (Should be the latest version). If a new version of Akaunting is released, [follow these steps](https://akaunting.com/docs/update) to *manually* upgrade Akaunting. Pulling an updated version of this image **does not** *automatically* upgrade Akaunting.
