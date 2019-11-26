# Client App
FROM node:alpine as client-app
LABEL authors="John Papa"
WORKDIR /usr/src/app
COPY ["package.json", "npm-shrinkwrap.json*", "./"]
RUN npm install
COPY . .
RUN npm run build

# Node server
FROM node:alpine as node-server
WORKDIR /usr/src/app
COPY ["package.json", "npm-shrinkwrap.json*", "./"]
RUN npm install --production && mv node_modules ../
COPY . .

# Final image
FROM node:alpine
WORKDIR /usr/src/app
COPY --from=node-server /usr/src /usr/src
COPY --from=client-app /usr/src/app/server/www ./server/www
EXPOSE 3001
CMD ["node", "index.js"]
