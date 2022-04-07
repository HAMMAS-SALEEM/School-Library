require './rentals'

class Book
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end
  attr_reader :rentals
  attr_accessor :title, :author

  def add_rentals=(person, date)
    Rental.new(self, person, date)
  end
end
