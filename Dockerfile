FROM node:10-alpine3.9
WORKDIR /app
COPY . /app
RUN npm install
CMD npm start