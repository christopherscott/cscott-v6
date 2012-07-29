
# module dependencies
express = require 'express'
routes = require './routes'
http = require 'http'
path = require 'path'
stylus = require 'stylus'

app = express()

# basic application configuration
app.configure () ->
  app.set 'port', process.env.PORT || 3000
  app.set 'views', "#{__dirname}/views"
  app.set 'view engine', 'ejs'
  app.use express.favicon()
  app.use express.logger 'dev'
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.cookieParser 'your secret here'
  app.use app.router
  app.use stylus.middleware "#{__dirname}/public"
  app.use express.static path.join __dirname, 'public'

# dev specific middleware
app.configure 'development', () ->
  app.use express.errorHandler()

# mount routes
app.get '/', routes.index

# start app
http.createServer(app).listen app.get('port'), () ->
  console.log "Express server listening on port #{app.get('port')}"





