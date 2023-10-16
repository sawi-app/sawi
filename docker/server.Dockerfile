FROM node:alpine

WORKDIR /usr/src/app
COPY . .
RUN npm install --omit=dev
RUN npm run build

CMD [ "node", "./dist/server.js" ]
