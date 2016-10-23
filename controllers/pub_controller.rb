#index
get '/pubs' do
  @pubs = Pub.all
  erb( :'pubs/index' )
end

#new
get '/pubs/new' do
  erb( :'pubs/new')
end

#create
post '/pubs' do
  @pub = Pub.new(params)
  @pub.save
  redirect to( "pubs" )
end

#show
get '/pubs/:id' do
  @pub =Pub.find(params['id'])
  erb(:'pubs/show')
end
#edit

#update

#delete