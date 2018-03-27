class Book < ActiveRecord::Base
  belongs_to :library
  belongs_to :user#, through: :reservation


#
def validate?(book)
x = book.availability
case x
when true
  puts 'is available'
else
  puts 'not available'
  end
end

# end
# def feeling_lucky
#   Book.all.select do |book|
#     book.book_id == rand(1...5)
# end
#   puts book.title
# end
end
