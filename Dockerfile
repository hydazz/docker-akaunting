FROM vcxpz/baseimage-alpine-nginx

# set version label
ARG BUILD_DATE
ARG AKAUNTING_RELEASE
LABEL build_version="Akaunting version:- ${AKAUNTING_RELEASE} Build-date:- ${BUILD_DATE}"
LABEL maintainer="Alex Hyde"

# environment settings
ENV AKAUNTING_RELEASE $AKAUNTING_RELEASE

RUN \
   echo "**** install runtime packages ****" && \
   apk add --no-cache --upgrade \
      curl \
      unzip \
      php7-ctype \
      php7-dom \
      php7-gd \
      php7-mysqli \
      php7-mysqlnd \
      php7-openssl \
      php7-pdo_mysql \
      php7-fileinfo \
      php7-posix \
      php7-session \
      php7-tokenizer \
      php7-xml \
      php7-zip \
      php7-zlib && \
   mkdir -p /opt/akaunting && \
   echo "Akaunting version: ${AKAUNTING_RELEASE}" > /opt/akaunting/version && \
   echo "**** cleanup ****" && \
   apk del --purge \
      build-dependencies && \
   rm -rf \
      /tmp/*

# copy local files
COPY root/ /

# nginx healthcheck
HEALTHCHECK --start-period=10s --timeout=5s \
  CMD nginx -t -c /config/nginx/nginx.conf || exit 1

# ports and volumes
EXPOSE 443
VOLUME /config /data
