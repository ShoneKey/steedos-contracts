FROM node:12-alpine
WORKDIR /app
COPY . /app
RUN yarn config set registry https://registry.npm.taobao.org/ \
    && yarn --force 
CMD npm start