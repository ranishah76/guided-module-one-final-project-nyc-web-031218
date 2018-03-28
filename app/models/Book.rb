class Book < ActiveRecord::Base
  belongs_to :library
  belongs_to :user#, through: :reservation

  def self.validate_book(x)
   m = x.availability
  case m
  when true
    puts 'This is available. Would you like to reserve?'
    response = gets.chomp
  else
    puts 'This is not available, sorry!'
    Book.choose_option(x)
    end
     l = x #l is our whole book instance
     y = response
     puts self.reserve(y, l)
  end

  def self.reserve(y, l)
    case y
    when "yes"
      l.availability = false
      l.save
      puts "You have now reserved the book. Have a great day"
    when "no"
      puts "Have a great day!"
    end
  end

  # def change_availability(l)
  #   puts l.availability
  #   binding.pry
  # end


  def self.return_book
    puts "What is the title of the book?"
    response = gets.chomp
    x = Book.all.find do |book|
     book.title == response
   end
    x.availability = true
    x.save
    puts "Perfect, thanks for returning"
  end



def self.choose_option(x)
  puts "Would you like to try our new feature feeling lucky or find a book based in the same genre of what you were looking for?"
  puts "A - Feeling Lucky"
  puts "B - Suggested Book within same genre"
  puts "C - Neither"
  response = gets.chomp
  case response
  when "A"
    Book.feeling_lucky
  when "B"
    x
    puts "Great - let's figure something out"
    Book.suggested_book(x)
  when "C"
    puts "Ok, no worries! Have a great day!"
  end
  x
end



def self.feeling_lcky
  puts "Perfect. You're a daredevil. Are you ready?".red
  puts "3".red
  sleep(3)
  puts "2".black
  sleep(3)
  puts "1".green
  x = Book.all.find do |book|
    book.id == rand(1...5)
  end
  puts "This is a chosen book for you! Title: #{x.title} Author: #{x.author}".green
  puts "Would you like to reserve the book?"
  response = gets.chomp
  Book.reserve(response, x)
  end

  def self.suggested_book(x)
    j = Book.all.select do |book|
      book.genre == x.genre && book.availability == true
    end
     k = j.sample
    #   #j is the new array of specific random book instance within genre
       puts "We thought you might like this: Title: #{k.title} by #{k.author}"
       puts "Would you like to reserve this book?"
    response = gets.chomp
    Book.reserve(response, k)
    end
  end
