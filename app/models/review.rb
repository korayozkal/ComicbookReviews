class Review < ApplicationRecord
  belongs_to :user
  belongs_to :comicbook

  validates :rating, presence: true
  validates :comment, presence: true
  validates_length_of :comment, :maximum => 300
  #validates :comicbook, uniqueness: {scope: :user_id, message: "may only have one review/rating per user"}
end
