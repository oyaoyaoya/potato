class School < ApplicationRecord
  enum school_type: { university: 0, grad_school: 1 }
  has_many :departments
  has_many :faculties
end
