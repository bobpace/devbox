# nodebox

Run with dynamic port

    devbox -P --name nodebox bobpace/nodebox

example script for webpack-dev-server (can place in package.json scripts)

    DEVSERVERPORT=$(sudo docker port nodebox 8080 | sed -e 's/.*://') webpack-dev-server --colors --hot

example webpack.config.js

    var devServerPort = process.env.DEVSERVERPORT

    module.exports = {
      cache: true,

      entry: ['webpack-dev-server/client?http://dockerhost:' + devServerPort, 'webpack/hot/dev-server', './entry'],

      output: {
        path: __dirname,
        filename: 'bundle.js'
      },

      module: {
        loaders: [
            {test: /\.cjsx$/, loader: "react-hot!coffee!cjsx"},
            {test: /\.coffee$/, loader: "coffee"},
            {test: /\.jsx$/, loader: "jsx"},
            {test: /\.less$/, loader: "style!css!less"},
            {test: /\.(eot|svg|ttf|woff)$/, loader: "file"},
          ]
      },

      resolve: {
        extensions: ['', '.js', '.jsx', '.coffee', '.cjsx']
      }
    }
