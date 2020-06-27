FROM python:3.6-stretch

FROM node:12-alpine
COPY --from=0 /usr/bin/python3.5 /usr/bin/python3.5m /usr/bin/python /usr/bin/python2.7 /usr/lib/python2.7 /usr/lib/python3.5 /etc/python3.5 /etc/python /etc/python2.7 /usr/local/bin/python /usr/local/bin/python3.6 /usr/local/bin/python3.6-config /usr/local/bin/python3.6m /usr/local/bin/python3.6m-config /usr/local/lib/python3.6 /usr/local/lib/python3.5 /usr/local/lib/python2.7 /usr/share/python  /
WORKDIR /app
COPY . /app
RUN cat /etc/issue \
    && yarn config set registry https://registry.npm.taobao.org/ \
    && export NODE_TLS_REJECT_UNAUTHORIZED=0 \
    && yarn config set "strict-ssl" false \
    && yarn install --python="/usr/bin/python"
CMD yarn start