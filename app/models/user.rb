class User < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods #should i keep this if i override it?

  has_many :user_collections
  has_many :collections, through: :user_collections
  has_secure_password
  validates :username, :email, presence: true

  def slug
    username.downcase.gsub(" ", "-")
  end

end
