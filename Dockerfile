FROM node:12-alpine3.9
WORKDIR /app
COPY . /app
RUN npm config set registry http://registry.npm.taobao.org/ \
    && npm i yarn -g \
    && npm install -g typescript \
    && yarn config set registry http://registry.npm.taobao.org/ \
    && yarn --force 
CMD npm start