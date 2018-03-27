class Book < ActiveRecord::Base
  belongs_to :library
  belongs_to :user#, through: :reservation

  def self.validate_book(x)
   m = x.availability
  case m
  when true
    puts 'is available. Would you like to reserve?'
    response = gets.chomp
  else
    puts 'not available'
    end
     l = x
     y = response
     self.reserve(y, l)
  end

  def self.reserve(y, l)
    case y
    when "yes"
      l.availability = false
      l.save
      puts "You have now reserved the book"
    when "no"
      puts "Have a great day!"
    end
  end
  binding.pry

def self.feeling_lucky
  x = Book.all.find do |book|
    book.id == rand(1...5)
 end
   puts x.title
end

end
