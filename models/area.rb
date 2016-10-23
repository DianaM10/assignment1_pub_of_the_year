require_relative('../db/sql_runner')

class Area

attr_reader( :id, :pub_id, :area_name)

  def initialize(options)
    @id = options['id'].to_i
  ??  @area_id = options['area_id'].to_i
    @area_name = options['area_name']
  end

end
