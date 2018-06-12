class Book < ApplicationRecord
  belongs_to :course
  def publisher
  	"Rishabh"
  end
end
