const mongoose = require('mongoose');

mongoose.Promise = global.Promise;

const mongoUri = "mongodb://mongo:27017/connect-heroes"
function connect() {
  mongoose.set('debug', true);
  return mongoose.connect(mongoUri, { useMongoClient: true });
}

module.exports = {
  connect,
  mongoose
};
