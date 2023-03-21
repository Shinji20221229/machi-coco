class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets, dependent: :destroy
  has_many :tweet_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :profile_image

  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower

# 　退会機能
  has_many :tweets, :dependent => :destroy
  # 退会ユーザーに日続くお気に入りも削除する場合
  has_many :favorites, :dependent => :destroy
  # 退会ユーザーに紐づくコメントも削除する場合
  # has_many :comments, :dependent => :destroy


  validates :last_name,presence: true, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :farst_name,presence: true, length: { minimum: 2, maximum: 20 }, uniqueness: true


  def self.guest
    find_or_create_by!(email: 'aaa@aaa.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
      user.nickname = 'サンプル'
    end
  end


  # フォロー・フォロワー分岐
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end

  # ユーザー画像
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @user = User.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @user = User.where("name LIKE?", "#{word}")
    elsif search == "backward_match"
      @user = User.where("name LIKE?", "#{word}")
    elsif search == "partial_match"
      @user = User.where("name LIKE?", "#{word}")
    else
      @user = User.all
    end
  end

end
