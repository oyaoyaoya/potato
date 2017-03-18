class Textbook < ApplicationRecord
  has_many :items
  belongs_to :course
end
