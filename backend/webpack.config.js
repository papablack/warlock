const path = require('path');
const keysTransformer = require('ts-transformer-keys/transformer').default;
const TsconfigPathsPlugin = require('tsconfig-paths-webpack-plugin');

const  RWSWebPackSettings  = require('rws-js-server/rws.webpack.config');

RWSWebPackSettings.resolve.plugins = [
  new TsconfigPathsPlugin({configFile: './tsconfig.json'})
]

RWSWebPackSettings.output.path = path.resolve(__dirname, 'build');
RWSWebPackSettings.output.filename = 'warlock.server.js',


RWSWebPackSettings.devtool = 'source-map';
RWSWebPackSettings.mode = 'development';

// console.log(RWSWebPackSettings);

module.exports = RWSWebPackSettings;