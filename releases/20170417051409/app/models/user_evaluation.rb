class UserEvaluation < ApplicationRecord
  belongs_to :purchaser
  belongs_to :seller
  belongs_to :item
end
