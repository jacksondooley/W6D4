class Artworkshare < ApplicationRecord
  validates :viewer_id, uniqueness: { scope: :artwork_id}

  belongs_to :viewer,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: :User

  belongs_to :artwork,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :Artwork
end