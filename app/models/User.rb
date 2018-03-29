class User < ActiveRecord::Base
  has_many :reservations
  has_many :books, through: :reservations
  has_many :libraries #through: :books
###user is good here
  def self.find_book(user)
    puts "\nDang. This is exciting #{user}. Write the title of the book below, and we'll let you know if it's availble."
    response = gets.chomp
     x = Book.all.find do |book|
      book.title.downcase == response.downcase
    end
    user
    Book.validate_book(x, user)
  end

  def self.main_menu(user)
    user
    puts "\nSo #{name} here are your options, just select A, B or C:".yellow
    puts "A".yellow + "- Got a book in mind. Let's find it"
    puts "B".yellow + "- No idea. Help me out. PLEAAAASE."
    puts "C".yellow + "- Breaking-up with my book. Need to return it."
    puts "D".yellow + "- Want to peek at all your books?"
    puts "E".yellow + "-Gotta run! Type exit."
    response = gets.chomp.upcase
    case response
    # if response.downcase == "a"
  when "A"
      user
      User.find_book(user)
    when "B"
      puts "\nDon't worry, we've got your back!".yellow
      puts "\nJust tell us a book that you love. And we'll find something similiar."
      response = gets.chomp.downcase
       x = Book.all.find do |book|
        book.title.downcase == response.downcase
      end
       user
      Book.suggested_book(x, user)
    when "C"
      Book.return_book(user)
    when "D"
      puts "\nThese are your current reservations:\n".yellow
      user.my_reservations
    end
end

def add_book(book)
Reservation.create(user: self, book: book)
self.reservations
end

def my_reservations
  x = Reservation.all.select do |reservation|
    self.id == reservation.user_id
  end
  j = x.collect do |user_reservation|
    user_reservation.book_id
  end
  books = j.map do |id|
    x = Book.all.find(id)
  end
  books.each do |book|
    puts "\n#{book.title} by: #{book.author}".yellow
  end
  User.main_menu(self)

end

end
