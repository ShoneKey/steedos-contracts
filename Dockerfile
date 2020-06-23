FROM steedos/jsreport-2.5.0-full:oracle-instantclient

ADD . /app

WORKDIR /app

RUN cat apt-sources.list > /etc/apt/sources.list \
&& apt-get update \
&& apt-get install -y build-essential g++ \
&& npm cache clean -f \
&& npm install n -g \
&& n stable \
&& npm config set registry http://registry.npm.taobao.org/ \
&& npm i yarn -g \
&& npm install -g typescript \
&& yarn config set registry http://registry.npm.taobao.org/ \
&& yarn --force 
CMD yarn start