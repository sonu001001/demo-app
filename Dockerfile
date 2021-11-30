# syntax=docker/dockerfile:1
FROM node:12.18.1

ENV NODE_ENV=production

WORKDIR /app

COPY . .

RUN npm install --production

RUN npm install -g pm2

CMD ["pm2-runtime", "server.js"]

