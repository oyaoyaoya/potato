class Department < ApplicationRecord
  belongs_to :school
  belongs_to :source_department
end
