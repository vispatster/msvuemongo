# Client App
FROM node:8.9-alpine as client-app
LABEL authors="John Papa"
WORKDIR /usr/src/app
COPY ["package.json", "npm-shrinkwrap.json*", "./"]
RUN npm i -g npm-check-updates
RUN ncu -u
RUN npm install
COPY . .
RUN npm run build

# Node server
FROM node:8.9-alpine as node-server
WORKDIR /usr/src/app
COPY ["package.json", "npm-shrinkwrap.json*", "./"]
RUN npm i -g npm-check-updates
RUN ncu -u
RUN npm install --production && mv node_modules ../
COPY . .

# Final image
FROM node:8.9-alpine
WORKDIR /usr/src/app
COPY --from=node-server /usr/src /usr/src
COPY --from=client-app /usr/src/app/server/www ./server/www
EXPOSE 3001
CMD ["node", "index.js"]
