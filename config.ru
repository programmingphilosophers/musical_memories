
require 'sinatra/base'

require('./controllers/application')
require('./controllers/item')
require('./controllers/validations')
require('./models/item')
require('./models/validations')

map('/') { run ValidationsController }
map('/items') { run ItemController } # /items/name_of_route
