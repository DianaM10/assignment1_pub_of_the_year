require( 'pry-byebug')

#index
get '/votes' do
@votes = Vote.all
erb( :'votes/index')
end
#new (ask how to check pub already voted and votes not the same)
get '/votes/new' do
  @pubs = Pub.all
  @votes = Vote.all
  erb( :'votes/new')
end

#create (how to turn back into id's)
post '/votes' do

  # @vote.pub_id(vote.voted_by)
  # @vote.pub_id(vote.first)
  # @vote.pub_id(vote.second)
  # @vote.pub_id(vote.third)

  # @vote = Vote.new(params)
  # @vote.save
  # redirect to( "votes" )
end
#show (working)
get '/votes/:id' do
  @vote =Vote.find(params['id'])
  erb(:'votes/show')
end

#edit
get '/votes/:id/edit' do
  @vote = Vote.find( params['id'] )
  erb( :'votes/edit')
end

#update (Should not be able to update votes)
# put '/votes/:id' do
#   @vote = Vote.new(params)
#   @vote.update()
#   redirect to( "/votes/#{params['id']}")
# end

#delete (working)
delete '/votes/:id' do
  @vote = Vote.new(params)
  @vote.destroy()
  redirect to( "/votes")
end