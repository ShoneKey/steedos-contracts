FROM steedos/jsreport-2.5.0-full:oracle-instantclient

ADD . /app

WORKDIR /app

RUN cat apt-sources.list > /etc/apt/sources.list \
&& apt-get install --reinstall ca-certificates
&& apt-get update 
RUN apt-get install -y build-essential g++ 
RUN npm config set registry http://registry.npm.taobao.org/ \
&& npm cache clean -f \
&& npm install n -g 
RUN n stable 
RUN npm i yarn -g \
&& npm install -g typescript 
RUN yarn config set registry http://registry.npm.taobao.org/ \
&& yarn --force 
CMD yarn start