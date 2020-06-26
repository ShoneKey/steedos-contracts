FROM node:12-alpine3.12
WORKDIR /app
COPY . /app
RUN npm install
CMD npm start