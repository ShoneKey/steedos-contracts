FROM python:3.6-stretch
RUN whereis python \
    && whereis pip

FROM node:12-alpine
WORKDIR /app
COPY . /app
RUN cat /etc/issue \
    && yarn config set registry https://registry.npm.taobao.org/ \
    && export NODE_TLS_REJECT_UNAUTHORIZED=0 \
    && yarn config set "strict-ssl" false \
    && yarn install
CMD yarn start