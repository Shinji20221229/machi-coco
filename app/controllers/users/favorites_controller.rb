class Users::FavoritesController < ApplicationController

  def create
    tweet =Tweet.find(params[:tweet_id])
    favorites = current_user.favorites.new(tweet_id: tweet.id)
    favorites.save
    @tweet = Tweet.find(params[:tweet_id])
    redirect_to tweet_path(params[:tweet_id])
  end

  def destroy
    tweet = Tweet.find(params[:tweet_id])
    favorite = current_user.favorites.find_by(tweet_id: tweet.id)
    favorite.destroy
    @tweet = Tweet.find(params[:tweet_id])
    redirect_to tweet_path(params[:tweet_id])
  end

end
