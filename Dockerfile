FROM node:12-alpine
WORKDIR /app
COPY . /app
RUN npm --version \
    && yarn install
CMD yarn start