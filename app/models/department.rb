class Department < ApplicationRecord
  enum department_status: { published: 0, closed: 1 }
  belongs_to :school
  belongs_to :faculty
  has_many   :courses
  has_many   :users
  delegate :name, to: :user, prefix: true
end
