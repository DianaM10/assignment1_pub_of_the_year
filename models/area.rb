require_relative('../db/sql_runner')

class Area

attr_reader( :id, :area_name)

  def initialize(options)
    @id = options['id'].to_i
    @area_name = options['area_name']
  end

  def save()
    sql = "INSERT INTO areas (area_name) VALUES ('#{@area_name}') RETURNING *"
    area = SqlRunner.run(sql).first
    @id = area['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM areas"
    return Area.map_items(sql)
  end

  def self.delete_all
    sql = "DELETE FROM areas"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM areas WHERE id = #{id}"
    return Area.map_item(sql)
  end

  def find_pubs_in_area()
    sql = "SELECT * FROM pubs WHERE area_id = #{@id}"
    return Pub.map_items(sql)
  end



  def self.map_items(sql)
    areas = SqlRunner.run(sql)
    result = areas.map { |area| Area.new( area) }
    return result
  end

  def self.map_item(sql)
    result = Area.map_items(sql)
    return result.first
  end

end
