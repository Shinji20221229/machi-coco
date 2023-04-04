class Admin::TweetsController < ApplicationController
  def index
    @tweets = Tweet.page(params[:page]).per(12)
    @tweet = Tweet.new
    @user = current_user
  end

  def show
    @tweet = Tweet.find(params[:id])
    @user = @tweet.user
    @tweet_comment = TweetComment.new
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweets_path, notice: "削除しました"
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content, :tweet_image, :content_image)
  end

end
