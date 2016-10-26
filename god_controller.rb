require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry-byebug')

require_relative( './models/pub' )
require_relative( './models/vote' )
require_relative( './models/area' )
require_relative( './models/analysis' )
require_relative( './controllers/pub_controller.rb' )
require_relative( './controllers/vote_controller.rb' )
require_relative( './controllers/area_controller.rb' )

get '/results' do
  pubs = Pub.all
  @league_table = Analysis.all_pubs_and_points_arrays_in_array(pubs)
  erb( :home )
end