class UniversityDepartment < ApplicationRecord
  belongs_to :university
  belongs_to :department
end
