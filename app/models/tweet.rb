class Tweet < ApplicationRecord
  has_one_attached :image
  belongs_to :user

 def favorited_by?(user)
   favorites.exists?(user_id: user.id)
 end

end
