class FavoritesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @favorite = current_user.favorites.build(post: @post)
      authorize @favorite
        
    if @favorite.save
      flash[:notice] = "Post was favorited."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Post was not favorited. Please try again."
      redirect_to [@post.topic, @post]
    end
  end
    
  def destroy
    @post = Post.find(params[:post_id])
    @favorite = @post.favorites.find(params[:id])
      authorize @favorite
        
    if @favorite.destroy
      flash[:notice] = "Favorite was removed."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Favorite couldn't be deleted. Try again."
      redirect_to [@post.topic, @post]
    end
  end
end