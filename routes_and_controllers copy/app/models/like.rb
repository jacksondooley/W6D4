class Like < ApplicationRecord
  belongs_to :liker,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :source_type,
    primary_key: :id,
    foreign_key: :source_id,
    polymorphic: true

end