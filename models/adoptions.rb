require_relative('../db/sql_runner.rb')
require_relative('./animals.rb')
require_relative('./owners.rb')

class Adoption

  attr_accessor :id, :animal_id, :owner_id

  def initialize( options )
    @id = options['id'].to_i
    @animal_id = options['animal_id'].to_i
    @owner_id = options['owner_id'].to_i
  end

  def save()
    sql = "INSERT INTO adoptions
    (
      animal_id,
      owner_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@animal_id, @owner_id]
    adoption_data = SqlRunner.run(sql, values)
    @id = adoption_data.first()['id'].to_i
  end

  def update()
    sql = "UPDATE adoptions SET (
    animal_id,
    owner_id
    ) =
    (
      $1, $2
      ) WHERE id = $3"
      values = [@animal_id, @owner_id]
      SqlRunner( sql, values )
    end

    def self.delete_all()
      sql = "DELETE FROM adoptions"
      SqlRunner.run(sql)
    end

    def delete()
      sql = "DELETE FROM adoptions WHERE id = $1"
      values = [@id]
      SqlRunner.run( sql, values )
    end

    def self.all()
      sql = "SELECT * FROM adoptions"
      adoptions = SqlRunner.run( sql )
      results = adoptions.map {|adoption| Adoption.new( adoption ) }
      return results
    end

    def animals()
      sql = "SELECT * FROM animals WHERE id = $1"
      values = [@animal_id]
      results = SqlRunner.run(sql, values)
      return Animal.new( results.first)
    end

    def owners()
      sql = "SELECT * FROM owners WHERE id = $1"
      values = [@owner_id]
      results = SqlRunner.run(sql, values)
      return Owner.new( results.first )
    end

  end
