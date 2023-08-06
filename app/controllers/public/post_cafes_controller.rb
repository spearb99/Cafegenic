class Public::PostCafesController < ApplicationController
  
  def index
    @post = Post.all
    @tag_list = CafeTag.all
  end
  
  def create
   @post = Post.new(post_params)
   @pos.user_id = current_user.id
   # 受け取った値を,で区切って配列にする
   tag_list = params[:post_cafe][:name].split(',')
    if @post.save
       @post.save_cafe_tags(tag_list)
       redirect_to post_path, notice:'投稿が完了しました'
    else
       render :new
    end
  end
  
  def search_tag
    #検索結果画面でもタグ一覧表示
    @tag_list = CafeTag.all
    　#検索されたタグを受け取る
    @tag = cafeTag.find(params[:cafe_tag_id])
    　#検索されたタグに紐づく投稿を表示
    @post = @tag.post_cafes
  end
end
