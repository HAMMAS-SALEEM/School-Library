require './classes/book'
require_relative 'ui_formating'
require_relative 'data_processing'

module AppBooks
  include UiFormat
  include ProcessData
  def list_books(books)
    if books.length.zero?
      puts 'No Books Available'
    else
      books.each_with_index { |book, idx| puts "#{idx})  Book: #{book.title}, Author: #{book.author}" }
    end
    back_to_menu
  end

  def create_book(books)
    print 'Enter Book Title: '
    title = gets.chomp
    print 'Enter Book Author: '
    author = gets.chomp
    book = Book.new(title, author)
    books.push(book)
    book_data = { title: book.title, author: book.author }
    stored_books = fetch_data('books')
    stored_books.push(book_data)
    update_data('books', stored_books)
    puts 'Book Successfully Created'
    back_to_menu
  end
end
