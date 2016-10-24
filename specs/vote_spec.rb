require('minitest/autorun')
require_relative('../models/vote')
require_relative('../db/seeds')


class TestVote < MiniTest::Test

  def setup
    @vote = Vote.new
  end

  def test_pub_id(name)
    result = @vote.pub_id("The Abbotsford")
    assert_equal( '@pub1.pub_id', result)
  end

end