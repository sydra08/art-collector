class Artist < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  has_many :artworks
  validates :name, presence: true
    validates_uniqueness_of :name, :case_sensitive => false, :message => "An artist with that name already exists"

  def self.sort_by_artwork_count
    self.all.sort{|a,b| b.artworks.count <=> a.artworks.count}
  end

end
