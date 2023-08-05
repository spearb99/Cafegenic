class Public::RelationshipController < ApplicationController
  
  def create
    current_user.follow(params[:user_id])
    @user = User.findw(params[:user_id])
  end
  
  # フォロー外すとき
  def destroy
    current_user.unfollow(params[:user_id])
    @user = User.findw(params[:user_id])
  end
end
