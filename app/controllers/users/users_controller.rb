class Users::UsersController < ApplicationController

  before_action :set_user, :only => [:show, :favorites, :comments, :destroy]

  def index
    @users = User.all
    @user = current_user
    @tweet = Tweet.new
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.order("created_at DESC").page(params[:page]).per(7)
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

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "退会処理をしました"
    redirect_to root_path
  end


  private

  def user_params
    params.require(:user).permit(:farst_name, :last_name, :profile_image)
  end

  def set_user
    @user = User.find_by(:id => params[:id])
  end

  def is_matching_login_user
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end

end
