FROM node:12-alpine

WORKDIR /usr/src/hexo

ADD docker-entrypoint.sh /usr/bin/docker-entrypoint.sh

RUN set -eux && \
    sed -i 's/dl-cdn.alpinelinux.org/mirror.tuna.tsinghua.edu.cn/g' /etc/apk/repositories && \
    npm config set registry https://registry.npm.taobao.org && \
    apk add --no-cache git && \
    npm install hexo-cli -g


EXPOSE 4000

ENTRYPOINT ["sh","/usr/bin/docker-entrypoint.sh"]
