FROM steedos/jsreport-2.5.0-full:oracle-instantclient

ADD . /app

WORKDIR /app

RUN apt-get install -y build-essential g++

RUN npm cache clean -f 

RUN npm install n -g

RUN n stable

RUN npm config set registry http://registry.npm.taobao.org/

RUN npm i yarn -g

RUN npm install -g typescript

RUN yarn config set registry http://registry.npm.taobao.org/

RUN yarn --force

CMD ["yarn", "start"]