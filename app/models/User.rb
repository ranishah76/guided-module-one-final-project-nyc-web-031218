class User < ActiveRecord::Base
  has_many :books, through: :reservation
  has_many :libraries #through: :books

  def self.find_book
    puts "Dang. This is exciting. Write the title of the book below, and we'll let you know if it's availble."
    response = gets.chomp.downcase
     x = Book.all.find do |book|
      book.title == response
    end
    Book.validate_book(x)
  end

  def self.main_menu
    puts "Here are your options, just select A, B or C:"
    puts "A - Got a book in mind. Let's find it"
    puts "B - No idea. Help me out. PLEAAAASE."
    puts "C - Breaking-up with my book. Need to return it.\n" #return
    puts "D - Goodbye"
    response = gets.chomp.upcase
    case response
    # if response.downcase == "a"
  when "A"
      User.find_book
    when "B"
      puts "Don't worry, we've got your back!"
      puts "Just tell us a book that you love. And we'll find something similiar."
      response = gets.chomp.downcase
       x = Book.all.find do |book|
        book.title == response
      end
      Book.suggested_book(x)
    when "C"
      response.downcase == "c"
      Book.return_book
    when "D"
      Book.feeling_lucky

    end
    ##response must be a, b, or c - if not please choose a, b, or c.

  end
end
