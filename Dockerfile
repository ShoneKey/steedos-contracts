FROM node:12-alpine
WORKDIR /app
COPY . /app
RUN npm --version \
    && npm config get proxy \
    && npm config get https-proxy\
    && yarn config get proxy \
    && yarn config get https-proxy \
    && yarn config set registry http://registry.npm.taobao.org/ \
    && yarn --force    
CMD yarn start