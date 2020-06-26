FROM node:12-alpine3.12
WORKDIR /app
COPY ./package.json ./app
RUN npm install
COPY . /app
CMD npm start