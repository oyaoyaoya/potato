class Item < ApplicationRecord
  enum status: { very_bad: 0, bad: 1, normal: 2, good:3, very_good: 4 }
  belongs_to :course
  belongs_to :textbook
  belongs_to :user
  scope :which_is_same_as_user_faculty, -> current_user {
    joins(:courses).where('courses.faculty_id = ?', current_user.faculty_id)
  }
#やりたいこと→関連テーブルのfaculty_idが自分のfaculty_id
  class << self
    def localed_statuses
      statuses.keys.map do |s|
        [ApplicationController.helpers.t("status.item.#{s}"), s]
      end
    end
  end
end
