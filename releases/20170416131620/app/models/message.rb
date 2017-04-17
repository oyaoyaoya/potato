class Message < ApplicationRecord
  validates :body, presence: true
  validates :user_id, presence: true
  validates :contract_id, presence: true
  
  belongs_to :contract
  belongs_to :from_user, class_name: "User", foreign_key: "user_id"
end
