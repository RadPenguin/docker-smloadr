FROM node:current-alpine

ARG BUILD_DATE
ARG VERSION
LABEL build_version="RadPenguin version:- ${VERSION} Build-date:- ${BUILD_DATE}"

ENV TZ="America/Edmonton"
ENV SMLOADR_REPO="https://git.fuwafuwa.moe/SMLoadrDev/SMLoadr.git"
ENV SMLOADR_VERSION="v1.9.5"

RUN \
 echo "**** install build packages ****" && \
 apk add --no-cache --virtual=build-dependencies \
    alpine-sdk \
    git \
    tzdata && \
 echo "**** install runtime packages ****" && \
 apk add --no-cache \
    ca-certificates \
    tzdata && \
  echo "**** install smloadr ****" && \
  git clone -b $SMLOADR_VERSION $SMLOADR_REPO /opt/smloadr && \
  cd /opt/smloadr && \
  npm install && \
 echo "**** cleanup ****" && \
 apk del --purge \
	build-dependencies && \
 rm -rf \
        /root/go/ \
	/tmp/*

WORKDIR /opt/smloadr
VOLUME ["/opt/smloadr/SMLoadrConfig.json", "/opt/smloadr/downloadLinks.txt", "/opt/smloadr/DOWNLOADS"]
ENTRYPOINT ["/usr/local/bin/node", "/opt/smloadr/SMLoadr.js"]
