const path = require('path');

const RWSWebpackWrapper  = require('@rws-framework/client/rws.webpack.config');
const executionDir = process.cwd();

module.exports = RWSWebpackWrapper({
  dev: false,
  hot: false,
  report: false,
  tsConfigPath: executionDir + '/tsconfig.json',
  entry: `${executionDir}/src/index.ts`,
  executionDir: executionDir,
  publicDir:  path.resolve(executionDir, 'public'),
  outputDir:  path.resolve(executionDir, 'public', 'js'),
  outputFileName: 'warlock.client.js',  
  parted: true,
  partedDirUrlPrefix: '/js',
  copyAssets: {
    './public/js/' : [      
      './src/styles/compiled/main.css'
    ]
  },
  rwsPlugins: [
    '@rws-framework/nest-interconnectors',
    '@rws-framework/browser-router'
  ]
});