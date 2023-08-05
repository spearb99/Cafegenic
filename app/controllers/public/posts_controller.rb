class Public::PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to post_path(@post)
  end

  def index
      @posts = Post.all
  end

  def indexfav
     favorites = Favorite.where(user_id: current_user.id).pluck(:post_id)
     @posts = Post.where(id: favorites)
  end


  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
     @post = Post.find(params[:id])
    if @post.update(post_params)
       redirect_to post_path(@post)
    else
       redirect_to post_path(@post)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

 def post_params
    params.require(:post).permit(:post_image, :text, :shop_name, :address, :longitude, :latitude )
 end
end
