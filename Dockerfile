FROM node:12-alpine
WORKDIR /app
COPY . /app
RUN npm --version \
    && yarn config set registry https://registry.npm.taobao.org/ \
    && yarn install
CMD yarn start