FROM node:12-alpine
WORKDIR /app
COPY . /app
RUN npm config set strict-ssl false \
    && yarn config set registry https://registry.npm.taobao.org/ \
    && yarn install 
CMD npm start