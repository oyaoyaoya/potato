class Course < ApplicationRecord
  enum text_presence: { existed: 0, not_existed: 1 }
  enum period: { period_one: 0, period_two: 1 }
  enum day: { monday: 0, tuesday: 1 }
  has_many :faculty_and_courses
  has_many :department_and_courses
  has_many :textbooks
  belongs_to :professor
  scope :id_is, -> current_user {
    where(faculty_id: current_user.faculty_id)
  }
  scope :search_by, -> (name) { where('name LIKE(?)', "%#{name}%") }
end
