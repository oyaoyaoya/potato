class Item < ApplicationRecord
  enum status: { very_bad: 0, bad: 1, normal: 2, good:3, very_good: 4, non: 5 }
  enum item_type: { sell: 0, item_order: 1 }
  enum delivery: { hand: 0, mercari: 1, both: 2}

  validates :name, presence: true
  validates :delivery, presence: true
  validates :price, numericality: {
    only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10000
  }
  validates_associated :textbook, :course
  # validates :seller_id, presence: true
  validates :item_type, presence: true
  validates :status, presence: true, if: :for_sell?

  belongs_to :course
  belongs_to :textbook
  belongs_to :sell_user, class_name: 'User', :foreign_key => 'seller_id'

  has_one :contract, dependent: :destroy
  has_one :seller, through: :contract
  has_one :purchaser, through: :contract

  has_many :item_comments

  scope :which_is_same_as_user_faculty, -> current_user {
    joins(:courses).where('courses.faculty_id = ?', current_user.faculty_id)
  }
  default_scope { where(published: true)}
  # default_scope { order(created_at: desc) }

  def for_sell?
    item_type == "sell"
  end
#やりたいこと→関連テーブルのfaculty_idが自分のfaculty_id
  class << self
    def localed_statuses
      statuses.keys.map do |s|
        [ApplicationController.helpers.t("status.item.#{s}"), s]
      end
    end
  end
end
