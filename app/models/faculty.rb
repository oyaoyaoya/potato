class Faculty < ApplicationRecord
  belongs_to :school
  
  has_many   :departments
  has_many   :courses
end
