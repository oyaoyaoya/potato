class University < ApplicationRecord
  has_many :users
  has_many :department
  has_many :courses
  has_many :items
end
