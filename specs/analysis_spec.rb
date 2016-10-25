require 'minitest/autorun'
require 'minitest/rg'
require_relative '../models/analysis'
require_relative '../db/seeds'

class TestAnalysis < MiniTest::Test



  def test_find_first_votes_for_pub
    assert_equal(@first,find_first_votes_for_pub(@pub_id))
  end
  # def test_voted_first
  #   @votes.voted_first
  #   assert_equal( [396, 382, 394, 383, 396, 398, 398, 382,396], @first)
  # end


    
  




end