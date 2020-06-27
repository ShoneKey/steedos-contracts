FROM node:12-alpine
WORKDIR /app
COPY . /app
RUN npm --version \
    && yarn config set registry http://registry.npm.taobao.org/ \
    && yarn --force    
CMD yarn start