require('pry-byebug')
require_relative('../db/sql_runner')
require_relative( 'pub' )
require_relative( 'vote' )
require_relative( 'area' )

class Analysis

  attr_reader :areas

  def initialize
    @areas = Area.all()
    @pubs = Pub.all()
  end

  def self.find_points_for_first_votes(pub_id)
    sql = "SELECT COUNT(*) AS first_votes FROM votes WHERE first = #{pub_id}"
    result = SqlRunner.run(sql).first
    no_of_first_votes = result["first_votes"].to_i
    first_points = no_of_first_votes * 5 
    return first_points
  end

  def self.find_points_for_second_votes(pub_id)
    sql = "SELECT COUNT(*) AS second_votes FROM votes WHERE second = #{pub_id}"
    result = SqlRunner.run(sql).first
    no_of_second_votes = result["second_votes"].to_i
    second_points = no_of_second_votes * 3
    return second_points
  end

  def self.find_points_for_third_votes(pub_id)
    sql = "SELECT COUNT(*) AS third_votes FROM votes WHERE third = #{pub_id}"
    result = SqlRunner.run(sql).first
    no_of_third_votes = result["third_votes"].to_i
    third_points = no_of_third_votes * 1
    return third_points
  end

  def self.find_points_for_pub(pub_id)
    return self.find_points_for_first_votes(pub_id) + self.find_points_for_second_votes(pub_id) +self.find_points_for_third_votes(pub_id)
  end

  def self.pub_points_array(pub_id)
      pub_array = []
      pub = Pub.find(pub_id)
      pub_array << pub.name
      pub_array << self.find_points_for_pub(pub_id)
      return pub_array
  end

  def self.all_pubs_and_points_arrays_in_array(pubs)
    pubs = Pub.all
    league_table = []
    for pub in pubs
      league_table << self.pub_points_array(pub.id)
    end
    return league_table.sort!{ |x,y|  y[1]<=>x[1]}

  end

  # def self.pubs_and_points_for_city_centre_pubs(area_name)
  #   sql = "SELECT * FROM areas WHERE area_name = '#{area_name}'"
  #   result = SqlRunner.run(sql).first
  #   city = result['id'].to_i
  #   centre_pubs = []
  #   pubs_in_centre = @pubs.find_pubs_in_area(city)
  #   for pub in pubs_in_centre
  #      points = self.find_points_for_pub(pub.id)
  #   end
  #   centre_pubs << pubs_in_centre.name
  #   centre_pubs << points
  #   return centre_pubs
  # end

#   # % @analysis.areas.each do |area| %>
#   #    <tr>
#   #      <td><%#= pub[0] %></td>
#   #      <%= area.area_name %>
#   #     <% area.find_pubs_in_area.each do |pub| %>
#   #       <%= pub.name %> <%= Analysis.find_points_for_pub(pub.id)%>
  
def self.pubs_and_points_for_city_centre_pubs(area_name)
    centre_pubs = []
    for area in @areas
      area = area.area_name
      for pub in area.find_pubs_in_area 
        centre_pubs << pub.name
        points = self.find_points_for_pub(pub.id)
        centre_pubs << points
      end
    end
  

end
end

Analysis.pubs_and_points_for_city_centre_pubs("City Centre")

binding.pry


#
