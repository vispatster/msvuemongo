forked from https://github.com/Azure-Samples/vue-cosmosdb
---
languages:
- javascript
- nodejs
page_type: sample
products:
- azure
- azure-cosmos-db
description: "A Cosmos DB, Express.js, Vue, and Node.js app."
---

# vue-cosmosdb

A Cosmos DB, Express.js, Vue, and Node.js app

> Please see the [`connect2017`](https://github.com/Azure-Samples/vue-cosmosdb/tree/connect2017?WT.mc_id=connect-c9-jopapa) branch to see the sample use in the Connect 2017 video (link coming soon)

## Features

This project framework provides the following features:

* Vue.js
* Node.js
* Express
* Mongoose API
* Connecting to MongoDB or CosmosDB
* Building, Debugging, Deploying with Docker

## Getting Started

### Prerequisites

Node.js with npm

### Installation

``` bash
git clone https://github.com/Azure-Samples/vue-cosmosdb.git
cd vue-cosmosdb
npm install
```

### Database settings

* Configure Cosmos DB server settings

    Rename the `.env.example.js` file to `.env` in the root folder and update it with your Cosmos DB settings. Replace the accountName, databaseName, key, and port with your specific configuration.

    ```javascript
    SERVER_PORT=3001
    PUBLICWEB=./server/www
    COSMOSDB_ACCOUNT=your_cosmos_account
    COSMOSDB_DB=your_cosmos_db
    COSMOSDB_KEY=your_cosmos_key
    COSMOSDB_PORT=10255
    ```

### Quickstart

This will build the app and run the dev server for Vue and WebPack. The Node express server will launch and WebPack will proxy the calls from the browser to the API in express. It will also  prepare it for local debugging.

``` bash
# build for production with minification
npm run build

# serve on http://localhost:8080
# and run the api on http://localhost:3001
npm run debug
```

### Local Prod Build

This will build the app and launch via the Node.js express server.

```bash
# build for production with minification
npm run build

# run the node server
npm start
```

### Docker

Build the image and run container.

``` bash
npm run docker-up
```

Build the image and run container for local debugging.

``` bash
npm run docker-up-debug
```
