class TweetController < ApplicationController
  def new
    @tweet = Tweet,new
  end

  def index
  end

  def show
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
