class Public::UsersController < ApplicationController
  
  def show
    @user = current_user
    @user = User.find(params[:id])
    @following_users = @user.following_users
    @follower_users = @user.follower_users
  end
  
  def edit
    @user = @user = User.find(params[:id])
  end
  
  def update
    @user = current_user
      if @user.update(user_params)
        flash[:notice] = "登録情報を変更しました"
        redirect_to users_path
      else
        render :edit
      end
  end
  
  def unsubscribe
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

# フォロワー一覧
  def followers
   user = User.find(params[:id])
   @users = user.follower_users
  end
  
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to post_path, notice: 'ゲストユーザーとしてログインしました。'
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
  

