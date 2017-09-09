class Faculty < ApplicationRecord
  enum school_status: { published: 0, closed: 1 }
  belongs_to :school

  has_many   :departments
  has_many   :courses
  # scope :for_selection, -> { not(name: "全学部" ) }
end
