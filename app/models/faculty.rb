class Faculty < ApplicationRecord
  belongs_to :school
  belongs_to :source_faculty
end
