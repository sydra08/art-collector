class Artist < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  has_many :artworks
  validates :name, presence: true
  validates_uniqueness_of :name, :case_sensitive => false
end
