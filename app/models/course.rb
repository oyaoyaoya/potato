class Course < ApplicationRecord
  enum text_presence: { existed: 0, not_existed: 1 }
  enum period: { period_one: 0, period_two: 1, period_three: 2, period_four: 3, period_five: 4, period_six: 5, period_seven: 6, other_option: 7 }
  enum day: { monday: 0,tuesday: 1, wednesday: 2, thursday: 3, friday: 4, saturday: 5, other_day: 6  }
  enum term: { first_term: 0, second_term: 1, hole_term: 2, other_terma: 3 }
  enum course_status: { published: 0, closed: 1 }

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
  scope :search_by_textbook, -> (name) { where('textbooks.name like ?', "%#{name}%")}
  scope :search_by_course, -> (name) { where('courses.name like ?', "%#{name}%")}
  scope :with_t, -> { includes(:textbooks) }
  scope :with_f, -> { includes(:faculty) }
  scope :with_attr, -> {includes(:textbooks, :faculty)}
  scope :joins_t, -> { joins(:textbooks) }
  scope :only_existed, -> { where(text_presence: 0)}

  include CsvExportable
end
