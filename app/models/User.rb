class User < ActiveRecord::Base
  has_many :books, through: :reservation
  has_many :libraries #through: :books

  def self.find_book
    puts "What is the title of the book that you're looking for?"
    response = gets.chomp
     x = Book.all.find do |book|
      book.title == response
    end.validate?(x)
  end


# def validate(x)
#   if x.availability == "true"
#     puts "This book is available, would you like to reserve?"
#    else
#      puts "Sorry! This book is not available, can we help you with something else?"
#      gets.chomp = response1
#    end
#  end
     # if response1 == "No"
     #  "Ok have a good day!"
  #  puts “What is the title of the book you’re looking for?"
  # #        Response = gets.chomp
  # #        Book.all.find do |book|
  # #        Book == response
  # #     end.validate?
  # # end
end
