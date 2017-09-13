class User < ActiveRecord::Base
  has_many :user_collections
  has_many :collections, through: :user_collections

  has_secure_password
  validates :username, :email, presence: true
end
