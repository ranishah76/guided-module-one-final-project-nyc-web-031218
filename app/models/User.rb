class User < ActiveRecord::Base
  has_many :books, through: :reservation
  has_many :libraries #through: :books

  def self.find_book(user)
    puts "\nDang. This is exciting #{user.name}. Write the title of the book below, and we'll let you know if it's availble."
    response = gets.chomp
     x = Book.all.find do |book|
      book.title.downcase == response.downcase
    end
    user
    Book.validate_book(x, user)
  end

  def self.main_menu
    puts "First off, what's your name?"
    name = gets.chomp
    user = User.all.find do |user|
      user.name.downcase == name.downcase
    end
    name
    puts "\nAwesome, love the name!"
    puts "So #{name} here are your options, just select A, B or C:".yellow
    puts "A".yellow + "- Got a book in mind. Let's find it"
    puts "B".yellow + "- No idea. Help me out. PLEAAAASE."
    puts "C".yellow + "- Breaking-up with my book. Need to return it."
    #puts "D".yellow + "- Want to peek at all your books?"

    response = gets.chomp.upcase
    case response
    # if response.downcase == "a"
  when "A"
      name
      User.find_book(user)
    when "B"
      puts "\nDon't worry, we've got your back!".yellow
      puts "\nJust tell us a book that you love. And we'll find something similiar."
      response = gets.chomp.downcase
       x = Book.all.find do |book|
        book.title.downcase == response.downcase
      end
      Book.suggested_book(x)
    when "C"
      Book.return_book
    when "D"
      User.list_book
    end
    ##response must be a, b, or c - if not please choose a, b, or c.

    def add_reservation(self.id, book.id)
      Reservation.new(self.id, book.id)
      binding.pry
      user.book = y
      binding.pry
  end
end
