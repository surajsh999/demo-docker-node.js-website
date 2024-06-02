FROM node:18-alpine3.15 as dev

LABEL MAINTAINER="<>"

WORKDIR /app

#RUN npm run clear

#RUN npm install && npm run build

EXPOSE 3000



FROM node:18-alpine3.15 as prod

LABEL MAINTAINER="<>"

WORKDIR /app

COPY . .

# Install Docusaurus CLI globally
RUN npm install -g @docusaurus/core

# Install build dependencies
RUN apk add --no-cache autoconf automake libtool nasm musl-dev

RUN npm run clear

RUN npm install && npm run build

CMD ["npm", "run", "serve"]
