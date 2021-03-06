class User < ApplicationRecord
  validates :username, presence: true
  validates :username, uniqueness: true

  has_many :artworks,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :Artwork,
    dependent: :destroy

  has_many :artwork_shares,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: :Artworkshare,
    dependent: :destroy
  
  has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewers

  has_many :comments,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Comment

  has_many :likes,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Likes


  
end