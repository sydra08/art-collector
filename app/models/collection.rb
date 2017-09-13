class Collection < ActiveRecord::Base
  has_many :artists, through: :artworks
  has_many :collection_artworks
  has_many :artworks, through: :collection_artworks

  validates :name, presence: true
end
