class Contract < ApplicationRecord
  enum status: { uncompleted: 0, completed: 1 }
  belongs_to :item
  belongs_to :user
  has_many :messages

  def self.last_message
    if self.messages.last.user.id == current_user.id
      "hoge"
    else
      "huga"
    end
  end
end
