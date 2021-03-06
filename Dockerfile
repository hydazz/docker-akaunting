FROM vcxpz/baseimage-alpine-nginx:php7

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
		gnu-libiconv \
		jq \
		php7-bcmath \
		php7-ctype \
		php7-curl \
		php7-dom \
		php7-gd \
		php7-iconv \
		php7-mysqli \
		php7-mysqlnd \
		php7-pdo_mysql \
		php7-posix \
		php7-tokenizer \
		php7-zip \
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
