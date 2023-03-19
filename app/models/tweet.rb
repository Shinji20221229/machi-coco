class Tweet < ApplicationRecord
  has_one_attached :tweet_image
  belongs_to :user
  has_many :tweet_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :content,presence:true,length:{maximum:200}
  validates :tweet_image,presence:true

  def favorited_by?(user)
   favorites.exists?(user_id)
  end

  def get_tweet_image
    (tweet_image.attached?) ? tweet_image : 'no_image.jpg'
  end

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @tweet = Tweet.where("title LIKE?", "#{word}")
    elsif search == "forward_match"
      @tweet = Tweet.where("title LIKE?", "#{word}")
    elsif search == "backward_match"
      @tweet = Tweet.where("title LIKE?", "#{word}")
    elsif search == "partial_match"
      @tweet = Tweet.where("title LIKE?", "#{word}")
    else
      @tweet = Tweet.all
    end
  end

end
