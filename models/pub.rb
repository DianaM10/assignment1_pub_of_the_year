require_relative('../db/sql_runner')

class Pub

attr_reader( :id, :name, :address)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @address = options['address']
    @area_id = options['area_id'].to_i
  end

  def save()
    sql = "INSERT INTO pubs (name, address, area_id) VALUES ( '#{@name}', '#{@address}', #{@area_id}) RETURNING *"
    pub = SqlRunner.run(sql).first
    @id = pub['id']
  end

  def self.all()
    sql = "SELECT * FROM pubs"
    return Pub.map_items(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM pubs"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    pubs = SqlRunner.run(sql)
    result = pubs.map { |pub| Pub.new(pub)}
    return result
  end

  def self.map_item(sql)
    result = Pub.new.map_items(sql)
    return result.first
  end










end