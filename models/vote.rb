require_relative('../db/sql_runner')

class Vote

attr_reader( :id, :voted_by, :first, :second, :third)

  def initialize(options)
    @id = options['id'].to_i
    @voted_by = options['voted_by'].to_i
    @first = options['first'].to_i
    @second = options['second'].to_i
    @third = options['third'].to_i
  end

  def save()
    sql = "INSERT INTO votes (voted_by, first, second, third) VALUES ('#{@voted_by}', '#{@first}', '#{@second}', '#{@third}') RETURNING *"
    vote = SqlRunner.run(sql).first
    @id = vote['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM votes"
    return Vote.map_items(sql)
  end

  def self.delete_all
    sql = "DELETE FROM votes"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    votes = SqlRunner.run(sql)
    result = votes.map { |vote| Vote.new( vote) }
    return result
  end

  def self.map_item(sql)
    result = Vote.map_items(sql)
    return result.first
  end

  def name()
    sql = "SELECT * FROM pubs where id = #{@pub_id}"
    return Pub.map_item(sql)
  end












end