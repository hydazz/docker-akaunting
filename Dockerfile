FROM vcxpz/baseimage-alpine-nginx:latest

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Akaunting version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="hydaz"

# environment settings
ENV VERSION=${VERSION}

RUN set -xe && \
	echo "**** install runtime packages ****" && \
	apk add --no-cache \
		php8-bcmath \
		php8-ctype \
		php8-curl \
		php8-dom \
		php8-gd \
		php8-mysqli \
		php8-mysqlnd \
		php8-pdo_mysql \
		php8-posix \
		php8-tokenizer \
		php8-zip \
		unzip && \
	mkdir -p /opt/akaunting && \
	echo "Image Version: ${VERSION}" >/opt/akaunting/version && \
	echo "**** cleanup ****" && \
	rm -rf \
		/tmp/*

# copy local files
COPY root/ /

# ports and volumes
VOLUME /config
