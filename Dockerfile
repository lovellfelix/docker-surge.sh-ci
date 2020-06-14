FROM node:lts-alpine

RUN apk add -U --no-cache shadow su-exec 
RUN npm -g install surge
RUN useradd -ms /bin/sh user

COPY entrypoint.sh /bin/entrypoint.sh

WORKDIR /usr/src/app

ENTRYPOINT [ "/bin/entrypoint.sh" ]
