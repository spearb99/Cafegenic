class Public::PostsController < ApplicationController
  before_action :authenticate_user!,except:[:index]
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
     # 受け取った値を,で区切って配列にする
    tag_list = params[:post][:name].split(',')
    if @post.save
       @post.save_cafe_tags(tag_list)
       redirect_to post_path(@post), notice:'投稿が完了しました'
    else
      render :new
    end
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
    @tag_list = @post.cafe_tags.pluck(:name)
    @post_cafe_tags = @post.cafe_tags
    @post_comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
    @tag_list=@post.cafe_tags.pluck(:name).join(',')
  end

  def update
     @post = Post.find(params[:id])
     tag_list = params[:post][:name].split(',')
    if @post.update(post_params)
       @post.save_cafe_tags(tag_list)
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
  
  def search
    @posts = Post.search(params[:keyword])
  end

  def indexsearch
    @posts = Post.search(params[:keyword])
  end

 private

  def post_params
    params.require(:post).permit(:post_image, :text, :shop_name, :address, :longitude, :latitude, :cafe_tag_id)
  end
end