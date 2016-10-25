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


# end
#   for vote in Vote.all
#     if vote.first == pub_id
#       redirect to(:'votes/error')
#     end
#   end
  # for vote in Vote.all
  #   if vote.second == pub_id
  #     redirect to (:'votes/error')
  #   end
  # end
  # for vote in Vote.all
  #   if vote.third == pub_id
  #     redirect to (:'votes/error')
  #   end
  # end
  # @vote.save
  # redirect to ("votes")
  

  # @vote =Vote.new( params) 
  # if @vote.voted_by != @votes.voted_by && @vote.voted_by != @vote.first || @vote.second || @vote.third
  # and if @vote.first != @vote.second || @vote.third
  # and if @vote.second != @vote.third
  #   return @vote.save
  #   redirect to ("votes")
  # else
  #   
  # end


    # check pub hasn't already voted
  # check if pub is voting for itself
  # check if same pub has been voted for more than once


  # if either is true, redirect back to the form with a query param message "Sorry you can't do that"


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