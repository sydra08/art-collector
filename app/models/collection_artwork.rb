class CollectionArtwork < ActiveRecord::Base
  belongs_to :artwork
  belongs_to :collection
end
