class Users::TweetCommentsController < ApplicationController
  def create
    tweet = Tweet.find(params[:tweet_id])
    comment = current_user.tweet_comments.new(tweet_comment_params)
    comment.tweet_id = tweet.id
    if comment.save
      redirect_to tweet_path(tweet)
    else
      redirect_to tweet_path(tweet)
    end
  end

  def destroy
    TweetComment.find(params[:id]).destroy
    redirect_to tweet_path(params[:tweet_id])
  end

  private

  def tweet_comment_params
    params.require(:tweet_comment).permit(:comment)
  end

end
