class Post < ApplicationRecord
   belongs_to :user
   has_many :comments, dependent: :destroy
   has_many :favorites, dependent: :destroy
   has_many :post_users, through: :favorite, source: :user
   has_many :post_cafe_tags, dependent: :destroy
   has_many :cafe_tags, through: :post_cafe_tags, source: :cafe_tag, dependent: :destroy
   has_one_attached :post_image


 def favorited_by?(user)
     favorites.exists?(user_id: user.id)
 end
 
 def get_post_image
    (post_image.attached?) ? post_image : 'no_image.jpg'
 end
  

 def save_cafe_tags(tags)
  # タグが存在していれば、タグの名前を配列として全て取得
    current_tags = self.cafe_tags.pluck(:name) unless self.cafe_tags.nil?
    # 現在取得したタグから送られてきたタグを除いてoldtagとする
    old_tags = current_tags - tags
    # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
    new_tags = tags - current_tags

    # 古いタグを消す
    old_tags.each do |old_name|
    self.cafe_tags.delete CafeTag.find_by(name:old_name)
    end

    # 新しいタグを保存
    new_tags.each do |new_name|
    cafe_tag = CafeTag.find_or_create_by(name:new_name)
    self.cafe_tags << cafe_tag
    end
 end
 def self.search(search)
    if search != ""
      Post.joins(:cafe_tags).joins(:user).where('shop_name LIKE(?) OR address LIKE(?) OR cafe_tags.name LIKE(?) OR users.name LIKE(?)', "%#{search}%", "%#{search}%", "%#{search}%","%#{search}%")
    else
      Post.all
    end
 end
end
