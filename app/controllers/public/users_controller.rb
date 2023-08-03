class Public::UsersController < ApplicationController
  
  def show
    @user = current_user
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
      if @user.update(user_params)
        flash[:notice] = "登録情報を変更しました"
        redirect_to users_mypage_path
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
  def user_params
    params.require(:user).permit(:name,:email,:introduction,:profile_image )
  end

end
