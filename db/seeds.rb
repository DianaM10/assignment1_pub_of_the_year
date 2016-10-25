require('pry-byebug')
require_relative('../models/pub')
require_relative('../models/vote')
require_relative('../models/area.rb')

Pub.delete_all()
Vote.delete_all()
Area.delete_all()

area1 = Area.new({ 'area_name' => "City Centre" })
area2 = Area.new({ 'area_name' => "South"})
area3 = Area.new({ 'area_name' => "North"})
area4 = Area.new({ 'area_name' => "West"})
area5 = Area.new({ 'area_name' => "East"})

area1.save
area2.save
area3.save
area4.save
area5.save

pub1 = Pub.new({ 'name' => "The Abbotsford", 'address' => "3 Rose Street", 'area_id' => area5.id })
pub2 = Pub.new({ 'name' => "Berts Bar", 'address' => "29 William Street", 'area_id' => area4.id })
pub3 = Pub.new({ 'name' => "Bow Bar", 'address' => "80 West Bow", 'area_id' => area1.id })
pub4 = Pub.new({ 'name' => "Malts and Hops", 'address' => "45 Shore", 'area_id' => area3.id})
pub5 = Pub.new({ 'name' => "Thompsons Bar", 'address' => "182-184 Morrison Street", 'area_id' => area4.id})
pub6 = Pub.new({ 'name' => "Tuechters a room in the west end", 'address' => "26 William Street", 'area_id' => area4.id})
pub7 = Pub.new({ 'name' => "Guildford Arms", 'address' => "1 West Register Street", 'area_id' => area1.id})
pub8 = Pub.new({ 'name' => "Nobles Bar", 'address' => "44 Constitution Street", 'area_id' => area3.id})
pub9 = Pub.new({ 'name' => "Roseleaf Bar and Cafe", 'address' => "23 Sandford Place", 'area_id' => area3.id})
pub10 = Pub.new({ 'name' => "Barneys Brewery and Beer", 'address' => "1 Summerhall", 'area_id' => area5.id})
pub11 = Pub.new({ 'name' => "Cask and Barrel New Town", 'address' => "115 Broughton Street", 'area_id' => area1.id})
pub12 = Pub.new({ 'name' => "The Cambridge Bar and Grill", 'address' => "20 Young Street", 'area_id' => area4.id})
pub13 = Pub.new({ 'name' => "Brewdog", 'address' => "143 Cowgate", 'area_id' => area1.id})
pub14 = Pub.new({ 'name' => "Cafe Royal", 'address' => "19 West Register Street", 'area_id' => area1.id})
pub15 = Pub.new({ 'name' => "The Canny Mans", 'address' => "237 Morningside Road", 'area_id' => area2.id})
pub16 = Pub.new({ 'name' => "Mathers Bar", 'address' => "1 Queensferry Street", 'area_id' => area1.id})
pub17 = Pub.new({ 'name' => "The Sheeps Heid", 'address' => "43-45 The Causeway", 'area_id' => area2.id})
pub18 = Pub.new({ 'name' => "The Rose Street Brewery", 'address' => "55-57 Rose Street", 'area_id' => area1.id})

pub1.save
pub2.save
pub3.save
pub4.save
pub5.save
pub6.save
pub7.save
pub8.save
pub9.save
pub10.save
pub11.save
pub12.save
pub13.save
pub14.save
pub15.save
pub16.save
pub17.save
pub18.save


vote1 = Vote.new({ 'voted_by' => pub1.id, 'first' => pub15.id, 'second' => pub17.id, 'third' => pub14.id})
vote2 = Vote.new({ 'voted_by' => pub2.id, 'first' => pub1.id, 'second' => pub17.id, 'third' => pub5.id})
vote3 = Vote.new({ 'voted_by' => pub3.id, 'first' => pub13.id, 'second' => pub15.id, 'third' => pub17.id})
vote4 = Vote.new({ 'voted_by' => pub4.id, 'first' => pub2.id, 'second' => pub6.id, 'third' => pub18.id})
vote5 = Vote.new({ 'voted_by' => pub5.id, 'first' => pub15.id, 'second' => pub10.id, 'third' => pub14.id})
vote6 = Vote.new({ 'voted_by' => pub6.id, 'first' => pub17.id, 'second' => pub15.id, 'third' => pub14.id})
vote7 = Vote.new({ 'voted_by' => pub7.id, 'first' => pub17.id, 'second' => pub8.id, 'third' => pub9.id})
vote8 = Vote.new({ 'voted_by' => pub8.id, 'first' => pub1.id, 'second' => pub2.id, 'third' => pub3.id})
vote9 = Vote.new({ 'voted_by' => pub9.id, 'first' => pub15.id, 'second' => pub13.id, 'third' => pub14.id})


vote1.save
vote2.save
vote3.save
vote4.save
vote5.save
vote6.save
vote7.save
vote8.save
vote9.save



# binding.pry
# nil
















