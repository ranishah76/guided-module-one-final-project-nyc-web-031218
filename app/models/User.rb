class User < ActiveRecord::Base
  has_many :books, through: :reservation
  has_many :libraries #through: :books

  def find_book
   puts “What is the title of the book you’re looking for?"
         Response = gets.chomp
         Book.all.find do |book|
         Book == response
      end.validate?
  end
end
