require_relative './book'
require_relative './classroom'
require_relative './person'
require_relative './rentals'
require_relative './student'
require_relative './teacher'

class APP
  def initialize
    @rentals = []
    @people = []
    @books = []
  end

  attr_reader :rentals, :people, :books

  def console_entry_point
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals of given person id'
    puts '7 - Quit'
  end
end
