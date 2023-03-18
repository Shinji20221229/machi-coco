class Tweet < ApplicationRecord
  has_one_attached :tweet_image
  belongs_to :user
  has_many :tweet_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :content,presence:true,length:{maximum:200}
  validates :tweet_image,presence:true

 def favorited_by?(user)
   favorites.exists?(user_id: user.id)
 end

 def get_tweet_image
    (tweet_image.attached?) ? tweet_image : 'no_image.jpg'
 end

end
