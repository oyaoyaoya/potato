class Item < ApplicationRecord
  belongs_to :user
  belongs_to :department
  belongs_to :university
  belongs_to :contract
  belongs_to :course
  has_many :item_likes
  has_many :item_comments
end
