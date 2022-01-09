FROM node:16-slim

WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install --production
COPY ./dist ./

CMD [ "npm", "start" ]