require './classes/book'
require_relative 'ui_formating'
require_relative 'data_processing'

module AppBooks
  include UiFormat
  include ProcessData
  def list_books
    books = fetch_data('books')
    puts books
    if books.length.zero?
      puts 'No Books Available'
    else
      books.each_with_index { |book, idx| puts "#{idx})  Book: #{book['title']}, Author: #{book['author']}" }
    end
    back_to_menu
  end

  def create_book
    print 'Enter Book Title: '
    title = gets.chomp
    print 'Enter Book Author: '
    author = gets.chomp
    book = Book.new(title, author)
    book = { title: book.title, author: book.author }

    books_contents = fetch_data('books')
    books_contents.push(book)
    update_data('books', books_contents)
    puts 'Book Successfully Created'
    back_to_menu
  end
end
