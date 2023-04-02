class Users::HomesController < ApplicationController
  def top
    @tweets = Tweet.all
  end


  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.farst_name = "Guest"
      user.last_name = "Guest"
    end
    sign_in user
    redirect_to tweets_path, notice: 'ゲストユーザーとしてログインしました'
  end

end
