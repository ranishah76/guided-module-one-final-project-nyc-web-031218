class Book < ActiveRecord::Base
  belongs_to :library
  has_many :reservations
  has_one :user, through: :reservations

###user is good here
  def self.validate_book(x, user)

   m = x.availability
  case m
  when true
    puts "\nJust your luck. This is available. Do you want to go right ahead, and reserve?"
    puts "\nHell yeah or nah?"
    response = gets.chomp.downcase.first
  else
    puts "\nThis is not available #{user.name}, </3!"
    Book.choose_option(x, user)
  end
     user
     l = x #l is our whole book instance
     y = response
     Book.reserve(y, l, user)

  end


  def self.reserve(y, l, user)
##y - l - and user are all good here
    case y
    when "h"
      l.availability = false
      l.save
      user.add_book(l)

      puts "\nITS YOURS.".bold.red
      puts "\nITS RESERVED."
      puts "\nBUT REMEMBER...."
      puts "\nNOT FOREVER </3"
      puts "\nDo you want to check your reservations? Type yes or no?"
      response = gets.chomp.first.downcase
      case response
      when "y"
        user.my_reservations
      when "n"
      Book.goodbye
    end
    when "y"
      l.availability = false
      l.save
      user.add_book(l)

      puts "\nITS YOURS.".bold.red
      puts "\nITS RESERVED."
      puts "\nBUT REMEMBER...."
      puts "\nNOT FOREVER </3"
      puts "\nDo you want to check your reservations? Type yes or no?"
      response = gets.chomp.first.downcase
      case response
      when "y"
        user.my_reservations
      when "n"
      Book.goodbye
    end
    when "n"
      puts "\nNo hard feelings."
      puts "\nHeading out? Just type- exit."
      puts "\nOr are you feeling lucky #GoogleStyle.....type- lucky"
      response = gets.chomp.downcase.first
    case response
    when "l"
      Book.feeling_lucky
    when "e"
      Book.goodbye
    end
    end
  end

  # def change_availability(l)
  #   puts l.availability
  #   binding.pry
  # end


  def self.return_book(user)
    puts "\nWhat is the title of the book?"
    response = gets.chomp.downcase
    x = Book.all.find do |book|
     book.title.downcase == response.downcase
   end
    x.availability = true
    x.save
    puts "\nGreat, #{x.title} has been returned."
    puts "\nAre you finished? Hell yeah or nah?"
    response = gets.chomp.downcase.first
    case response
    when "h"
    Book.goodbye
  when "y"
  Book.goodbye
  when "n"
    user
    User.main_menu(user)
    end
  end

def self.choose_option(x, user)
  puts "\nDon't stress. How about we help you find another book? Just pick from the options below."
  puts "\nA".yellow + "- I'm Feeling Lucky #GoogleStyle"
  puts "\nB".yellow + "I'm still feeling #{x.genre}."
  puts "\nC".yellow + "Neither."
  response = gets.chomp.downcase
  case response
  when "a"
    Book.feeling_lucky(user)
  when "b"
    x
    Book.suggested_book(x, user)
  when "c"
    puts "\nOk, no worries!"
    Book.goodbye
  end
  x
end



def self.feeling_lucky(user)
  puts "\nYOU daredevil.".bold.red
  sleep(1)
  puts "\nReady for an awesome book?".red
  sleep(1)
  puts "\n3".red
  sleep(2)
  puts "\n2".yellow
  sleep(1)
  puts "\n1".green
  # pid = fork{ exec 'afplay', ~/app/music/Elevator Music 1 hour-[AudioTrimmer.com].mp3}
  sleep(2)
  puts ""
  puts ""
  puts "\nWAIT FOR IT".yellow
  puts ""
  puts ""
  puts ""
  sleep(3)
  puts ""
  puts ""
  puts ""
  puts ""
  puts ""
  puts "WAIT FOR IT".bold.yellow
  puts ""
  puts ""
  puts ""
  sleep(3)
  # pid = fork{ exec 'killall', "afplay" }
  x = Book.all.sample
  puts "\nVoilà! Here's our pick for you:" + " #{x.title} by #{x.author}".green
  puts "\nDo you want go right ahead and reserve the book?"
  puts "\nHell yeah or nah?"
  response = gets.chomp.downcase.first
  Book.reserve(response, x, user)
  end

  def self.suggested_book(x, user)
    j = Book.all.select do |book|
      book.genre == x.genre && book.availability == true
    end
    if j=[]
      puts "Sorry no availble books, within that genre"
      puts "Try again via feeling lucky? (Yes) Or do you want to leave Bookflix? (Leave)"
      response = gets.chomp.downcase.first
     case response
     when "y"
        Book.feeling_lucky(user)
     when "l"
       Book.goodbye
     end
    else
     x
     user
     k = j.sample

    #   #j is the new array of specific random book instance within genre
       puts "\n#{x.genre.upcase} OMG.".yellow + " OUR FAVOURITE GENRE TOO!!"
       puts "\nWe thought you might like this: Title: #{k.title} by #{k.author}"
       puts "\nWould you like to reserve this book?"
    y = gets.chomp.downcase.first
    end
     y
    ###y - k - user are all good here
    Book.reserve(y, k, user)
    end


  def self.goodbye
    puts "\nThanks for checking us out. Loved having you here. Quick quote:"
    puts "\nThe more that you read, the more things that you'll know. The more you'll learn, the more places that you'll go.".bold.blue
    puts "\nDr.Seuss".bold.blue
  end

  end

  # frank << orwell
  # frank.remove(orwell)
