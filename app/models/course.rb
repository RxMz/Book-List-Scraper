class Course < ApplicationRecord
  belongs_to :book_list
  has_many :books
end
