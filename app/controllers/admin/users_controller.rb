class Admin::UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
      @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "登録情報を変更しました。"
      redirect_to admin_user_path(@user)
    else
      redirect_to admin_user_path(@user)
    end
  end
  
  def destroy
  end
  
    private

  def user_params
    params.require(:user).permit(:name, :email, :address, :is_deleted)
  end
  
  
  
  
end
