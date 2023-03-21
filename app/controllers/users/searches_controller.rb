class Users::SearchesController < ApplicationController
  before_action :authenticate_user!

  def new_guest
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました'
  end

end
