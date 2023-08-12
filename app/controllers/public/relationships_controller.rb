class Public::RelationshipsController < ApplicationController
  
  def create
    current_user.follow(params[:user_id])
    @user = User.find(params[:user_id])
    redirect
  end
  
  # フォロー外すとき
  def destroy
    current_user.unfollow(params[:user_id])
    @user = User.find(params[:user_id])
  end
end
