class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
end

# book_ids.each do |num|
# n = Book.all.select do |book|
# book.id == num
# end
# puts n.inspect
# end

# books = j.map do |id|
#   x = Book.all.find(id)
# end
# books.each do |book|
#   puts "#{book.title} by: #{book.author}"
# end
# Reservation.all.delete_if {|x| x.book_id == 7 }
