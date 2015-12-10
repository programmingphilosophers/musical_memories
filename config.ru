
require 'sinatra/base'

require('./controllers/application')
require('./controllers/memory')
require('./controllers/account')

require('./models/Memory')
require('./models/Account')

map('/') { run AccountController }
map('/memories') { run MemoryController } # /memories/name_of_route
