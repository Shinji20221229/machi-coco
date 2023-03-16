class Tweet < ApplicationRecord
  has_one_attached :tweet_image
  belongs_to :user
  has_many :tweet_comments, dependent: :destroy

 def favorited_by?(user)
   favorites.exists?(user_id: user.id)
 end

end
