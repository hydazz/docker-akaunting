ARG TAG
FROM vcxpz/baseimage-alpine-nginx:${TAG}

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Akaunting version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="hydaz"

# environment settings
ENV VERSION=${VERSION}

RUN \
   echo "**** install runtime packages ****" && \
   apk add --no-cache --upgrade \
     php7-bcmath \
     php7-ctype \
     php7-curl \
     php7-dom \
     php7-gd \
     php7-mysqli \
     php7-mysqlnd \
     php7-pdo_mysql \
     php7-posix \
     php7-tokenizer \
     php7-zip \
     unzip && \
   mkdir -p /opt/akaunting && \
   echo "Image Version: ${VERSION}" > /opt/akaunting/version && \
   echo "**** cleanup ****" && \
   rm -rf \
     /tmp/*

# copy local files
COPY root/ /

# http healthcheck
HEALTHCHECK --start-period=10s --timeout=5s \
  CMD curl --fail http://localhost/ || exit 1

# ports and volumes
VOLUME /config
