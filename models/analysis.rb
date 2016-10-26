require('pry-byebug')

class Analysis

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
    # binding.pry
    return league_table.sort!{ |x,y|  y[1]<=>x[1]}

  end
end



# def find_second_votes_for_pub(pub_id)
#   sql = "SELECT * FROM votes WHERE second = #{@pub_id}"
#   result = SqlRunner.run(sql)
#   result = votes.map { |vote| Vote.new(vote)}
#   return result 
#   @second << result
#   @second.count = no_of_second_votes
#   second_votes = no_of_second_votes * 3
# end

# def find_third_votes_for_pub(pub_id)
#   sql = "SELECT * FROM votes WHERE third = #{@pub_id}"
#   result = SqlRunner.run(sql)
#   result = votes.map { |vote| Vote.new(vote)}
#   return result 
#   @third << result
#   @third.count = no_of_third_votes
#   third_votes = no_of_third_votes * 1
# end

# def total_votes(pub_id)
#   total = find_first_votes_for_pub(pub_id) +find_second_votes_for_pub(pub_id)+find_third_votes_for_pub(pub_id)
# end


# def pub_points
#   @pubs = Pub.all
#   @votes = Vote.all
#   for pub in @pubs
#     @hash[:pub_id]
#     if vote.first == pub.pub_id
#       points + 5 

      
 


# for pub in vote.first
#   for each id of pub in the first column of the vote table add 5 points
#     add to a hash with pub_id as key and points as values.
# dp the same for second and add 3 points and add to hash
# do the same for third and add 1 point and add to hash


# for each pub in pubs, put in hash
#   iterate through first votes, for matching pub_id add 5 points to value of pub_id key
#   do same for second vote
#     do same for 3rd


#       we should then have hash full of all pubs with scores. then think of a way to sort this ! and out put to screen.
  # def pub_points
  #   binding.pry
  #   @points = Hash.new
  #   for pub in Pub.all
      
  #     @points = Hash.new(pub.pub_id)
  #   end

    # for vote in Vote.all
    #   if vote

    # end

  # end
  # def voted_first

  #   @votes = Vote.all
  #   @votes.map { |vote| @first << vote.first }
  #   return @first
  # end
