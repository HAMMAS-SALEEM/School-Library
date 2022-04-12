require 'date'
require './classes/rentals'
require_relative 'ui_formating'

module AppRentals
  include UiFormat
  def create_rental(rentals, people, books)
    if books.size.zero?
      puts 'No Books Available'
    elsif people.size.zero?
      puts 'No Person Available'
    else
      puts 'Select a book from the following list by number'
      books.each_with_index { |book, index| puts "#{index}) Book Title: #{book.title}, Author: #{book.author}" }
      rental_book = gets.chomp.to_i
      puts 'Select a person from the following list by number (not id)'
      people.each_with_index do |person, index|
        puts "#{index}) #{[person.type]} Name: #{person.name} Age: #{person.age} Id: #{person.id}"
      end
      rental_person = gets.chomp.to_i
      puts 'Enter date'
      date = convert_date(gets)
      rental_detail = Rental.new(people[rental_person], books[rental_book], date)
      rentals.push(rental_detail)
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
