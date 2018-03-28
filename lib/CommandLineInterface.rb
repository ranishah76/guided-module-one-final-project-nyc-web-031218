require 'pry'

def greeting
  puts "Howdy! Welcome to Book Finder!".yellow
  puts "What can we help you with today?"#“Howdy! How/’s it going? What can we help you with today?”
  puts "A - I would like to find out if this book is available."
  puts "B - I’m looking for something similiar to a certain book."
  puts "C - I would like to return a book"
  response = gets.chomp
  case response
  # if response.downcase == "a"
  when "a"
    User.find_book
  when "b"
    puts "What is the title of the book that you're looking for?"
    response = gets.chomp
     x = Book.all.find do |book|
      book.title == response
    end
    Book.suggested_book(x)
  when "c"
    response.downcase == "c"
    Book.return_book
  end
  ##response must be a, b, or c - if not please choose a, b, or c.

end

greeting
# Book.validate_book(User.find_book)
# Book.feeling_lucky << this works
# greeting
# Book.feeling_lucky
# User.find_book

# def show_users
#   puts User.all
# end

# Book.return_book

# def return_book
#     book.availability = "False"
#     book.user_id = nil
#     puts "Hope it was a great read!"
#     goodbye
#   end
#
# def option(response)
#   if response == "A"
#     return "Hey"
#   elsif response == "B"
#   return "Hey"
# else response == "C"
#   return_book
# end
# end

# return_book
