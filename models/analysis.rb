

class Analysis


  def initialize()
    @votes = Vote.all
    @pubs = Pub.all
    @first = []
    @second=[]
    @third =[]
    end

def find_first_votes_for_pub(pub_id)
  sql = "SELECT * FROM votes WHERE first = #{@pub_id}"
  result = SqlRunner.run(sql)
  result = votes.map { |vote| Vote.new(vote)}
  return result 
  @first << result
  @first.count = no_of_first_votes
  first_votes = no_of_first_votes * 5 
end

def find_second_votes_for_pub(pub_id)
  sql = "SELECT * FROM votes WHERE second = #{@pub_id}"
  result = SqlRunner.run(sql)
  result = votes.map { |vote| Vote.new(vote)}
  return result 
  @second << result
  @second.count = no_of_second_votes
  second_votes = no_of_second_votes * 3
end

def find_third_votes_for_pub(pub_id)
  sql = "SELECT * FROM votes WHERE third = #{@pub_id}"
  result = SqlRunner.run(sql)
  result = votes.map { |vote| Vote.new(vote)}
  return result 
  @third << result
  @third.count = no_of_third_votes
  third_votes = no_of_third_votes * 3
end

def total_votes(pub_id)
  total = find_first_votes_for_pub(pub_id) +find_second_votes_for_pub(pub_id)+find_third_votes_for_pub(pub_id)
end


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

end