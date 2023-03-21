class Admin::TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])
    @user = @tweet.user
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
