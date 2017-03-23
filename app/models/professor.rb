class Professor < ApplicationRecord
  belongs_to :school
  belongs_to :faculty
  belongs_to :department
  
  has_many   :courses
end
