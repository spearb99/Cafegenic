class Public::HomesController < ApplicationController
  before_action :authenticate_user!,except:[:top]
  
  def top
    posts = Post.all
    @new_posts = posts.sort_by { |post| post.created_at }.reverse.first(4)
  end
end
