#index
get '/areas' do
  @areas = Area.all
  erb( :'areas/index' )
end
#new (no areas to be added)

#create

#show
get '/areas/:id' do
  @pubs = Pub.all
  @area = Area.find(params['id'])
  @pubs_in_area = @area.find_pubs_in_area()
  # binding.pry
  erb(:'areas/show')
end

#edit

#update

#delete