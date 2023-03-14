class UsersController < ApplicationController
  def new
  end

  def index
  end

  def create
  end

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets
    @tweet = Tweet.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
