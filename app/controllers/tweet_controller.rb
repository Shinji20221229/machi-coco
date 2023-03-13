class Users::TweetsController < ApplicationController
  def new
    @tweet = Tweet,new
  end

  def index
    @tweets = Tweet.all
    @tweet = Tweet.new
    @user = current_user
  end

  def show
    @tweet = Tweet.find(params[:id])
    @user = @tweet.user
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    @tweet.save
    redirect_to tweet_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content, :content_image)
  end

end
