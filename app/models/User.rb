class User < ActiveRecord::Base
  has_many :books, through: :reservation
  #has_many :libraries, through: :books
end
