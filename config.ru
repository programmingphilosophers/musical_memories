
require 'sinatra/base'

require('./controllers/application')
require('./controllers/memory')
require('./controllers/user')
require('./models/memory')
require('./models/user')

map('/') { run UserController }
map('/memories') { run MemoryController } # /memorys/name_of_route
