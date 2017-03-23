class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :contracts
  has_many :messages
  has_many :items
  belongs_to :school
  belongs_to :faculty
  belongs_to :department
end
