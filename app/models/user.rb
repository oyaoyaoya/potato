class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: %i(google)

  belongs_to :school
  belongs_to :faculty
  belongs_to :department

  has_many :contracts
  has_many :messages
  has_many :items

  has_many :contracts_of_seller, class_name: "Contract", foreign_key: :seller_id
  has_many :contracts_of_purchaser, class_name: "Contract", foreign_key: :purchaser_id
  has_many :items_of_seller, through: :contracts_of_seller, :source => 'item'
  has_many :items_of_purchaser, through: :contracts_of_purchaser, source: 'item'

  enum user_status: { published: 0, closed: 1, admin: 2}

  def self.find_for_google(auth)
      user = User.find_by(email: auth.info.email)
      unless user
        user = User.create(name:     auth.info.name,
                           provider: auth.provider,
                           uid:      auth.uid,
                           email:    auth.info.email,
                           token:    auth.credentials.token,
                           password: Devise.friendly_token[0, 20])
      end
      return user
   end
end
