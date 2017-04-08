class Contract < ApplicationRecord
  enum status: { uncompleted: 0, pre_completed: 1, completed: 2}
  belongs_to :item

  belongs_to :seller, class_name: "User"
  belongs_to :purchaser, class_name: "User"

  has_many :messages

  validates :item_id, uniqueness: true
  validates :seller_id, presence: true
  validates :purchaser_id, presence: true

  def self.last_message
    if self.messages.last.user.id == current_user.id
      "hoge"
    else
      "huga"
    end
  end
end
