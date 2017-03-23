class Course < ApplicationRecord
  enum text_presence: { existed: 0, not_existed: 1 }
  enum period: { period_one: 0, period_two: 1 }
  enum day: { monday: 0, tuesday: 1 }

  has_many   :textbooks
  has_many   :items

  belongs_to :professor
  belongs_to :school
  belongs_to :department
  belongs_to :faculty

  scope :id_is, -> current_user {
    where(faculty_id: current_user.faculty_id)
  }
  scope :search_by, -> (name) { where('name LIKE(?)', "%#{name}%") }
end
