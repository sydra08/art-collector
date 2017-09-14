class User < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  has_many :user_collections
  has_many :collections, through: :user_collections
  has_secure_password
  validates :username, :email, presence: true
end
