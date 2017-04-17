class Department < ApplicationRecord
  enum department_status: { published: 0, closed: 1 }
  belongs_to :school
  belongs_to :faculty

  has_many   :courses

  include CsvExportable
end
