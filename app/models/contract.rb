class Contract < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_many :contract_messages
end
