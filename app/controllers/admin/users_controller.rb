class Admin::UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
    @tweet = Tweet.new
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.order("created_at DESC").page(params[:page]).per(5)
    @tweet = Tweet.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to tweets_path, notice: "削除しました"
  end

private
  def user_params
    params.require(:user).permit(:first_name,:last_name,:email)
  end
end
