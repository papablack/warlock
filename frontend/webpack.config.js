const path = require('path');

const RWSWebpackWrapper  = require('rws-js-client/rws.webpack.config');


const executionDir = process.cwd();

module.exports = RWSWebpackWrapper({
  dev: true,
  hot: false,
  report: false,
  tsConfigPath: executionDir + '/tsconfig.json',
  entry: `${executionDir}/src/index.ts`,
  executionDir: executionDir,
  publicDir:  path.resolve(executionDir, 'public'),
  outputDir:  path.resolve(executionDir, 'build'),
  outputFileName: 'warlock.client.js',
  copyToDir: {
    './public/js/' : [
      './build/warlock.client.js',
      './build/warlock.client.js.map',
      './src/styles/compiled/main.css'
    ]
  },
});