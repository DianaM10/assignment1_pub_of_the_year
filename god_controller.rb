require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry-byebug')

require_relative( './models/pub' )
require_relative( './models/vote' )
require_relative( './controllers/pub_controller.rb' )
require_relative( './controllers/vote_controller.rb' )