class FavoritesController < ApplicationController
  def create
    favorite=current_user.favorites.create(post_id: params[:post_id])
    redirect_to posts_path,notice:"#{favorite.user.name}さんをお気に入り登録"
  end

  def destroy
    favorite=current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to post_path,notice:"#{favorite.user.name}さんのお気に入り解除"
  end
end
