FROM node:lts-alpine

COPY ./fonts/* /usr/share/fonts/Chinese/

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
  apk add --no-cache tzdata libreoffice-writer ttf-dejavu fontconfig && \
  cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
  echo "Asia/Shanghai" > /etc/timezone && \
  apk del tzdata && \
  mkfontscale && mkfontdir && fc-cache && \
  npm config set registry https://registry.npmmirror.com && \
  rm -rf /var/cache/apk/*

# docker build . -t liudichen/node-lts-alpine-libreoffice --no-cache
