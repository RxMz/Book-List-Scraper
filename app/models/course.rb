class Course < ApplicationRecord
  belongs_to :booklist
  has_many :books
end
