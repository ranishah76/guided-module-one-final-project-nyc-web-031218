require 'pry'

def greeting
  puts "Howdy! Welcome to the BOOKFLIX!!!".bold.red
  sleep(1)
  puts "\nSo, fellow" + " #arrested developers".bold.red + ", I know what you're thinking, what are we?"
  sleep(1)
  puts "\nAs by our (#totallynon-cheesy) name - we're that" + " meet-cute".red + " between " + "books ".red + "and "  + "netflix.".red
  sleep(1)
  puts "\nOur first original (soon to be world-famous) CLI app for finding book recommendations."
  sleep(1)
  puts "\nSo lets not waste any time, what's your name?"
 name = gets.chomp
#User.new(name.to_s)###################
 user = User.all.find do |user|
  user.name.downcase == name.downcase
end
User.main_menu(user)
end

greeting

# def main_menu
#   puts "Here are your options, just select A, B or C:"
#   puts "A - Got a book in mind. Let's find it"
#   puts "B - No idea. Help me out. PLEAAAASE."
#   puts "C - Breaking-up with my book. Need to return it.\n" #return
#   puts "D - Goodbye"
#   response = gets.chomp.upcase
#   case response
#   # if response.downcase == "a"
# when "A"
#     User.find_book
#   when "B"
#     puts "Don't worry, we've got your back!"
#     puts "Just tell us a book that you love. And we'll find something similiar."
#     response = gets.chomp.downcase
#      x = Book.all.find do |book|
#       book.title == response
#     end
#     Book.suggested_book(x)
#   when "C"
#     response.downcase == "c"
#     Book.return_book
#   when "D"
#     Book.feeling_lucky
#
#   end
#   ##response must be a, b, or c - if not please choose a, b, or c.
#
# end
