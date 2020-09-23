class Review < ApplicationRecord
  belongs_to :user
  belongs_to :comicbook

  #validates_presence_of :rating, :comments
  #validates :comicbook, uniqueness: {scope: :user_id, message: "may only have one review/rating per user"}
end
