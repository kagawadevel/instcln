class FavoritesController < ApplicationController
  before_action :require_logged_in, only: [:index, :create, :destroy]

  def index
    @favorites = current_user.favorite_posts
  end

  def create
    favorite = current_user.favorites.create(post_id: params[:post_id])
    redirect_to post_path(params[:post_id]), flash: { success: "#{favorite.post.user.name}さんの投稿をお気に入りしました"}
  end

  def destroy
    favorite = current_user.favorites.find(params[:favorite_id]).destroy
    redirect_to post_path(params[:post_id]), flash: { success: "#{favorite.post.user.name}さんのお気に入りを解除しました"}
  end
end
