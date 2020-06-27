FROM node:12-alpine
WORKDIR /app
COPY . /app
RUN npm --version \
    && npm config set registry http://registry.npm.taobao.org/ \
    && npm install --save readable-stream \
    && yarn config set registry https://registry.npm.taobao.org/ \
    && export NODE_TLS_REJECT_UNAUTHORIZED=0 \
    && yarn install
CMD yarn start