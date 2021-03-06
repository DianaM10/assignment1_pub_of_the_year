

require( 'pry-byebug')

#index
get '/pubs' do
  @pubs = Pub.all
  erb( :'pubs/index' )
end

#new
get '/pubs/new' do
  @pubs = Pub.all
  @areas = Area.all
  erb( :'pubs/new')
end

#create
post '/pubs' do
  @areas = Area.all
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
get '/pubs/:id/edit' do
  @areas = Area.all
  @pub = Pub.find( params['id'] )
  erb( :'pubs/edit')
end

#update
put '/pubs/:id' do
  @pub = Pub.new(params)
  @pub.update()
  redirect to( "/pubs/#{params['id']}")
end

#delete
delete '/pubs/:id' do
  @pub = Pub.new(params)
  @pub.destroy()
  redirect to( "/pubs")
end
