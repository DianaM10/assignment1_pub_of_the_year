#index
get '/votes' do
@votes = Vote.all
erb( :'votes/index')
end
#new

#create

#show

#edit

#update

#delete