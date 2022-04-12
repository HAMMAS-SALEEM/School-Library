require 'date'
require './classes/rentals'
require_relative 'ui_formating'
require_relative 'data_processing'

module AppRentals
  include UiFormat
  include ProcessData

  def get_rental_inputs(books, people)
    puts 'Select a book from the following list by number'
    books.each_with_index { |book, index| puts "#{index}) Book Title: #{book.title}, Author: #{book.author}" }
    rental_book = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    people.each_with_index do |person, index|
      puts "#{index}) #{person.class} Name: #{person.name} Age: #{person.age} Id: #{person.id}"
    end
    rental_person = gets.chomp.to_i
    puts 'Enter date'
    date = convert_date(gets)
    [rental_book, rental_person, date]
  end

  def create_rental(rentals, books, people)
    stored_rentals = fetch_data('rentals')
    if books.size.zero?
      puts 'No Books Available'
    elsif people.size.zero?
      puts 'No Person Available'
    else
      rental_book, rental_person, date = get_rental_inputs(books, people)
      rental_object = Rental.new(people[rental_person], books[rental_book], date)
      rental_data = { date: date, book_index: rental_book, person_index: rental_person }
      rentals.push(rental_object)
      stored_rentals.push(rental_data)
      update_data('rentals', stored_rentals)
      puts 'Rental Successfully Created'
    end
    back_to_menu
  end

  def list_rentals(rentals, people)
    puts 'Select id of any person'
    people.each { |i| puts "[#{i.type.to_i}] id: #{i.id}, Person: #{i.name}" }
    print 'Person id: '
    person_id = gets.chomp
    rentals.each do |i|
      puts "Date: #{i.date}, Book: '#{i.book.title}' by #{i.book.author}" if i.person.id.to_i == person_id.to_i
    end
  end

  def convert_date(str)
    Date.parse(str)
  end
end
