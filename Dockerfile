FROM python:3.6

RUN wget https://nodejs.org/dist/v10.16.0/node-v10.16.0-linux-x64.tar.xz \
    && tar xf node-v10.16.0-linux-x64.tar.xz -C /opt/

ENV PATH=$PATH:/opt/node-v10.16.0-linux-x64/bin

WORKDIR /app
COPY . /app
RUN npm config set registry http://registry.npm.taobao.org/ \
    && npm i yarn -g \
    && npm install -g typescript \
    && yarn config set registry https://registry.npm.taobao.org/ \
    && export NODE_TLS_REJECT_UNAUTHORIZED=0 \
    && yarn config set "strict-ssl" false \
    && yarn install 
CMD yarn start