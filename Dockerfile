FROM node:12-alpine3.9
WORKDIR /app
COPY . /app
RUN yarn config set registry http://registry.npm.taobao.org/ \
    && yarn --force 
CMD npm start