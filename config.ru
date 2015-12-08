
require 'sinatra/base'

require('./controllers/application')
require('./controllers/memory')
require('./controllers/account')
require('./models/memory')
require('./models/account')

map('/') { run AccountController }
map('/memories') { run MemoryController } # /memorys/name_of_route
