class User < ActiveRecord::Base
  has_many :books, through: :librarycard
  belongs_to :library
end
