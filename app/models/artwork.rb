class Artwork < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  belongs_to :artist
  validates :name, presence: true
  validates_uniqueness_of :name, :case_sensitive => false, :message => "An artwork with that name already exists"
end
