class Textbook < ApplicationRecord
  enum textbook_status: { published: 0, closed: 1 }
  has_many :items
  belongs_to :course
end
