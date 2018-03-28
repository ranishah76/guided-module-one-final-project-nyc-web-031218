class Book < ActiveRecord::Base
  belongs_to :library
  belongs_to :user#, through: :reservation

  def self.validate_book(x)
   m = x.availability
  case m
  when true
    puts 'Just your luck. This is available. Do you want to go right ahead, and reserve?'
    puts "Hell yeah or nah?"
    response = gets.chomp.downcase.first
  else
    puts 'This is not available, </3!'
    Book.choose_option(x)
    end
     l = x #l is our whole book instance
     y = response
     puts self.reserve(y, l)
  end

  def self.reserve(y, l)
    case y
    when "h"
      l.availability = false
      l.save
      puts "ITS YOURS."
      puts "ITS RESERVED."
      puts "BUT REMEMBER...."
      puts "NOT FOREVER </3"
      puts "Happy reading! Bye for now."
      goodbye
    when "n"
      puts "No hard feelings."
      puts "Heading out? Just type- exit."
      puts "Or are you feeling lucky #GoogleStyle.....type- lucky"
      response = gets.chomp.downcase.first
    case response
    when "l"
      Book.feeling_lucky
    when "e"
      goodbye
    end
    end
  end

  # def change_availability(l)
  #   puts l.availability
  #   binding.pry
  # end


  def self.return_book
    puts "What is the title of the book?"
    response = gets.chomp.downcase
    x = Book.all.find do |book|
     book.title == response
   end
    x.availability = true
    x.save
    puts "Great, #{x.title} has been returned."
    puts "Are you finished? Hell yeah or nah?"
    response = gets.chomp.downcase.first
    case response
    when "h" || "y"
    goodbye
  when "n"
    User.main_menu
    end
  end



def self.choose_option(x)
  puts "Don't stress. How about we help you find another book? Just pick from the options below."
  puts "A - I'm Feeling Lucky #GoogleStyle"
  puts "B - I'm still feeling #{x.genre}."
  puts "C - Neither."
  response = gets.chomp.downcase
  case response
  when "a"
    Book.feeling_lucky
  when "b"
    x
    Book.suggested_book(x)
  when "c"
    puts "Ok, no worries!"
    goodbye
  end
  x
end



def self.feeling_lucky
  puts "YOU daredevil.".red
  sleep(1)
  puts "Ready for an awesome book?".red
  # sleep(1)
  # puts "3".red
  # sleep(2)
  # puts "2"
  # sleep(1)
  # puts "1".green
  # sleep(2)
  # puts ""
  # puts ""
  # puts "WAIT FOR IT".yellow
  # puts ""
  # puts ""
  # puts ""
  # sleep(2)
  # puts ""
  # puts ""
  # puts ""
  # puts ""
  # puts ""
  # puts "WAIT FOR IT".bold.yellow
  # puts ""
  # puts ""
  # puts ""
  # sleep(2)
  x = Book.all.sample
  puts "Voilà! Here's our pick for you: #{x.title} by #{x.author}".green
  puts "/n Do you want go right ahead and reserve the book?"
  puts "Hell yeah or nah?"
  response = gets.chomp.downcase.first
  Book.reserve(response, x)
  end

  def self.suggested_book(x)
    j = Book.all.select do |book|
      book.genre == x.genre && book.availability == true
    end
     x
     k = j.sample
    #   #j is the new array of specific random book instance within genre
       puts "#{x.genre.upcase} OMG. OUR FAVOURITE GENRE TOO!!"
       puts "We thought you might like this: Title: #{k.title} by #{k.author}"
       puts "Would you like to reserve this book?"
    y = gets.chomp.downcase.first
    Book.reserve(y, k)
    end
  end

  def goodbye
    puts "Thanks for checking us out. Loved having you here."
    puts "The more that you read, the more things that you'll know. The more you'll learn, the more places that you'll go."
    puts "Dr.Seuss"
  end
