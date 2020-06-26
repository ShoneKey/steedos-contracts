FROM node:10-alpine3.9
WORKDIR /app
COPY . /app
RUN npm config set registry http://registry.npm.taobao.org/ \
    && npm cache clean -f \
    && npm install
CMD npm start