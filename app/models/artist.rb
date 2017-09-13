class Artist < ActiveRecord::Base
  has_many :artworks

  validates :name, presence: true
end
