class BookList < ApplicationRecord
  belongs_to :term
  has_many :courses
end
