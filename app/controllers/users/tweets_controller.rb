class Users::TweetsController < ApplicationController
  def new
    @tweet = Tweet.new
  end

  def index
    @tweets = Tweet.page(params[:page]).per(5)
    @tweet = Tweet.new
    @user = current_user
  end

  def show
    @tweet = Tweet.find(params[:id])
    @user = @tweet.user
    @tweet_comment = TweetComment.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    if @tweet.save
      tags = Vision.get_image_data(@tweet.tweet_image)
      tags.each do |tag|
        @tweet.tags.create(name: tag)
      end
      redirect_to tweet_path(@tweet), notice: "投稿に失敗しました"
    else
      @tweets = Tweet.all
      redirect_to new_tweet_path
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet =  Tweet.find(params[:id])
    if tweet.update(tweet_params)
      redirect_to tweet_path(tweet), notice: "投稿しました"
    else
      @tweets = Tweet.all
      render 'index'
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweets_path, notice: "削除しました"
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content, :tweet_image,)
  end

end
