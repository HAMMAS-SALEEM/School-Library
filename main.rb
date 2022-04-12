require 'json'
require_relative './classes/app'
require './app_functionality/data_processing'

class Main
  include ProcessData
  def initialize
    @people = populate_people
    @books = populate_books
    @rentals = populate_rentals(@people, @books)
  end

  def list_options
    puts('-------------------------')
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals of given person id'
    puts '7 - Quit'
    puts('-------------------------')
    print 'Enter number of the operation: '
  end

  def option(input)
    case input
    when '1'
      App.new.list_books(@books)
    when '2'
      App.new.list_people(@people)
    when '3'
      App.new.create_person(@people)
    when '4'
      App.new.create_book(@books)
    when '5'
      App.new.create_rental(@rentals, @books, @people)
    when '6'
      App.new.list_rentals(@rentals, @people)
    else
      'Enter digit from 1 to 7'
    end
  end

  def console_entry_point
    puts ''
    puts 'Welcome to my School Library App'
    until list_options
      input = gets.chomp
      if input == '7'
        puts 'Thanks for using School Library App (^_^)'
        break
      end
      option input
    end
  end
end

Main.new.console_entry_point
