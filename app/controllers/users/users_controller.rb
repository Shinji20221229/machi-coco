class Users::UsersController < ApplicationController
  def new
  end

  def index
    @users = User.all
    @user = current_user
    @tweet = Tweet.new
  end

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets
    @tweet = Tweet.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "更新しました"
    redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  def is_matching_login_user
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end

end
