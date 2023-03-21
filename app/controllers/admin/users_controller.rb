class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
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
