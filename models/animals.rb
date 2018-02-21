require_relative('../db/sql_runner.rb')

class Animal

  attr_reader :id
  attr_accessor :name, :admission_date, :status, :species, :breed, :gender

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @gender = options['gender']
    @admission_date = options['admission_date']
    @status = options['status']
    @species = options['species']
    @breed = options['breed']
  end

  def save()
    sql = "INSERT INTO animals(
    name,
    gender,
    admission_date,
    status,
    species,
    breed
  )
  VALUES
  (
    $1, $2, $3, $4, $5, $6
    ) RETURNING id"
    values = [@name, @gender, @admission_date, @status, @species, @breed]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE animals SET (name, gender, admission_date, status, species, breed) = ($1, $2, $3, $4, $5, $6) WHERE id = $7"
    values = [@name, @gender, @admission_date, @status, @species, @breed, @id]
    SqlRunner.run(sql, values)
  end

  def destroy()
    sql = "DELETE FROM animals WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def adopt
    if @status == "available"
      @status = "adopted"
      end
      update
  end

  def self.available()
    sql = "SELECT FROM animals WHERE status = $1"
    values = [@status]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM animals"
    results = SqlRunner.run(sql)
    return results.map {|pet| Animal.new(pet)}
  end

  def self.delete_all()
    sql = "DELETE FROM animals"
    SqlRunner.run(sql)
  end

  def self.find( id )
    sql = "SELECT * FROM animals WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Animal.new( result.first)
  end

end
