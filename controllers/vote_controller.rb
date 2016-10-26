require( 'pry-byebug')

#index
get '/votes' do
  @votes = Vote.all
  erb( :'votes/index')
end
#new 
get '/votes/new' do
  @pubs = Pub.all
  @votes = Vote.all
  erb( :'votes/new')
end

# create 
post '/votes' do
  @vote = Vote.new(params)
  pub_id = @vote.voted_by
  illegal_vote = nil

  for vote in Vote.all
    if (vote.voted_by == pub_id)
      illegal_vote = 1 
    end
  end 

  if @vote.first == @vote.second || @vote.first == @vote.third || @vote.second == @vote.third 
    illegal_vote = 1
  end

  if @vote.voted_by == @vote.first || @vote.voted_by == @vote.second || @vote.voted_by == @vote.third
      illegal_vote = 1
  end

  if illegal_vote == 1
    erb(:'votes/error_voted_by')
  else
    @vote.save
    redirect to ("/votes")
  end
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