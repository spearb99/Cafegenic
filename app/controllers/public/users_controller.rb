class Public::UsersController < ApplicationController
  before_action :authenticate_user!,only:[:index,:show]

  def show
    #@user = current_user
    @user = User.find(params[:id])
    @following_users = @user.following_users
    @follower_users = @user.follower_users
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
      if @user.update(user_params)
        redirect_to user_path(@user)
      else
        render :edit
      end
  end

  def unsubscribe
  end

  def index
    if params[:keyword]
     @users = User.search(params[:keyword])
    else
     @users = User.all 
    end
  end

  def withdraw
    user = current_user
    user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会しました。"
    redirect_to new_user_registration_path
  end

  def follows
    user = User.find(params[:id])
    @users = user.following_users
  end

  def followers
   user = User.find(params[:id])
   @users = user.follower_users
  end
  
  def search
    if params[:keyword]
     @users = User.search(params[:keyword])
    else
     @users = User.all 
    end
  end

  def favorites
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:introduction,:profile_image )
  end
end


