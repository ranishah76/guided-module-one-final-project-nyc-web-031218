require 'pry'

def greeting
  puts "Howdy! Welcome to Book Finder!"
  puts "What can we help you with today?"#“Howdy! How/’s it going? What can we help you with today?”
  puts "A - I would like to find out if this book is available."
  puts "B - I’m looking for something similiar to a certain book."
  puts "C - I would like to return a book"
  response = gets.chomp
  if response.downcase == "a"
    User.find_book
  end
  ##response must be a, b, or c - if not please choose a, b, or c.

end

greeting
# Book.validate_book(User.find_book)
# Book.feeling_lucky << this works
# User.find_book

# def show_users
#   puts User.all
# end



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
