require_relative './decorator'
require_relative './rentals'

class Person < Nameable
  def initialize(age, parent_permission, name)
    @id = Random.rand(1..999_999_999)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    super()
  end

  def correct_name
    @name
  end

  attr_reader :id, :rentals
  attr_accessor :name, :age

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age?
  end

  def add_rentals=(book, date)
    Rental.new(book, self, date)
  end

  private :of_age?
end
