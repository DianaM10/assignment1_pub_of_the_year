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
  @analysis = Analysis.new()
  @league_table = Analysis.all_pubs_and_points_arrays_in_array(pubs)
  # pubs_in_area = Pub.find_pubs_in_area(pubs.area_id)
  # @area_league_table = Analysis.all_pubs_and_points_arrays_in_array(pubs_in_area)
  erb( :home )
end


