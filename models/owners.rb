require_relative('../db/sql_runner.rb')
require_relative('./animals.rb')

class Owner

  attr_reader :id
  attr_accessor :name, :address, :telephone_number

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @address = options['address']
    @telephone_number = options['telephone_number']
  end

  def save()
    sql = "INSERT INTO owners(
    name,
    address,
    telephone_number
    )
    VALUES(
    $1, $2, $3
    )
    RETURNING id"
    values = [@name, @address, @telephone_number]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE owners SET (name, address, telephone_number) = ($1, $2, $3) WHERE id = $5"
    values = [@name, @address, @telephone_number, @id]
    SqlRunner.run(sql, values)
  end

  def destroy()
    sql = "DELETE FROM owners WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM owners"
    results = SqlRunner.run(sql)
    return results.map {|owner| Owner.new(owner)}
  end

  def self.delete_all()
    sql = "DELETE FROM owners"
    results = SqlRunner.run(sql)
  end

  def animals()
    sql = "SELECT animals.* FROM animals INNER JOIN adoptions ON adoptions.animal_id = animals.id WHERE adoptions.owner_id = $1"
    values = [@id]
    results= SqlRunner.run( sql, values)
    return results.map {|adoption| Adoption.new(adoption)}
  end

end
