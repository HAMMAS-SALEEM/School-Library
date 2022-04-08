require_relative './book'
require_relative './classroom'
require_relative './person'
require_relative './rentals'
require_relative './student'
require_relative './teacher'
require 'date'

class App
  def initialize
    @rentals = []
    @people = []
    @books = []
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
      list_books
    when '2'
      list_people
    when '3'
      create_person
    when '4'
      create_book
    when
      create_rental
    else
      'Enter digit from 1 to 7'
    end
  end

  def list_books
    if @books.length.zero?
      puts 'No Books Available'
    else
      @books.each_with_index { |book, idx| puts "#{idx})  Book: #{book.title}, Author: #{book.author}" }
    end
    back_to_menu
  end

  def create_book
    print 'Enter Book Title: '
    title = gets.chomp
    print 'Enter Book Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book Successfully Created'
    back_to_menu
  end

  def create_person
    puts '1 - Create Student  2 - Create Teacher'
    select_option
    person = gets.chomp
    print 'Insert age: '
    age = gets.chomp
    print 'Insert name: '
    name = gets.chomp
    if person == '1'
      student = Student.new(age, name)
      @people.push(student)
    end
    if person == '2'
      print 'Insert specialization: '
      specialization = gets.chomp
      teacher = Teacher.new(specialization, age, name)
      @people.push(teacher)
    end
    puts 'Person Created Successfully'
    back_to_menu
  end

  # def validate_person(person)
  #   puts 'Enter digit between 1 & 2' unless person != '1' || person != '1'
  #   create_person
  # end

  def list_people
    puts 'No person available' if @people.length.zero?
    @people.each { |person| puts "Name: #{person.name} Age: #{person.age}" }
    back_to_menu
  end

  def create_rental
    if @books.size.zero?
      puts 'No Books Available'
    elsif @people.size.zero?
      puts 'No Person Available'
    else
      puts 'Select a book from the following list by number'
      @books.each_with_index { |book, index| puts "#{index}) Book Title: #{book.title}, Author: #{book.author}" }
      rental_book = gets.chomp
      puts 'Select a person from the following list by number (not id)'
      @people.each_with_index do |person, index|
        puts "#{index}) Name: #{person.name} Age: #{person.age} Id: #{person.id}"
      end
      rental_person = gets.chomp
      puts 'Enter date'
      date = convert_date(gets)
      rental_detail = Rental.new('hammas', 'avengers', date)
      @rental.push(rental_detail)
      puts 'Rental Successfully Created'
      rental_detail
    end
    back_to_menu
  end

  def list_rentals
    @rentals.each { |i| puts "Date: #{i.date} Person: #{i.person} Book: #{i.book}" }
  end

  def convert_date(str)
    Date.parse(str)
  end

  def select_option
    puts ''
    print 'Select option'
    puts ''
  end

  def back_to_menu
    puts ''
    print 'Press Enter to go in menu'
    gets.chomp
    puts ''
  end
end
