require 'minitest/autorun'
require 'minitest/rg'
require_relative '../models/analysis'
require_relative '../db/seeds'

class TestAnalysis < MiniTest::Test


  def test_find_by_name
    canny_mans = Pub.find_by_name("The Canny Mans")
    assert_equal("The Canny Mans", canny_mans.name)
  end

  def test_find_points_for_first_votes
    canny_mans = Pub.find_by_name("The Canny Mans")
    assert_equal( 15, Analysis.find_points_for_first_votes(canny_mans.id))
  end

  def test_find_points_for_second_votes
    canny_mans = Pub.find_by_name("The Canny Mans")
    assert_equal( 6, Analysis.find_points_for_second_votes(canny_mans.id))
  end

  def test_find_points_for_third_votes
    canny_mans = Pub.find_by_name("The Canny Mans")
    assert_equal( 0, Analysis.find_points_for_third_votes(canny_mans.id))
  end

  def test_find_points_for_pub
    canny_mans = Pub.find_by_name("The Canny Mans")
    assert_equal( 21, Analysis.find_points_for_pub(canny_mans.id))
  end

  def test_pub_points_array
    abbotsford = Pub.find_by_name("The Abbotsford")
    assert_equal(["The Abbotsford", 10], Analysis.pub_points_array(abbotsford.id))
  end

  def test_all_pubs_and_points_arrays_in_array
    pubs = Pub.all
    Analysis.all_pubs_and_points_arrays_in_array(pubs)

  #   assert_equal(["The Canny Mans", 21], ["The Abbotsford", 10], ["Brewdog", 8], ["Berts Bar", 5], ["The Sheeps Heid", 17], ["Tuechters a room in the west end", 3], ["Barneys Brewery and Beer", 3], ["Nobles Bar", 3], Analysis.all_pubs_and_points_arrays_in_array(pubs.name))
  end

  

  # def test_pubs_and_points_for_area
  # pubs = Pub.all
  # Analysis.pubs_and_points_for_area(pubs)


#   def test_sort_pubs_and_points_for_area
#     areas = Area.all
#     for area in areas
#     Analysis.sort_pubs_and_points_for_area(area.id)
#   end
# end

  





  # def test_pub_has_expected_points
  #   canny_mans = Pub.find_by_name("Canny Mans")
  #   total_points = Analysis.total_votes(canny_mans.id)

  #   assert_equal(54, total_points)
  # end
    
  




end