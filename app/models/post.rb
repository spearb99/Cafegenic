class Post < ApplicationRecord
 belongs_to :user
 has_one_attached :post_image
 has_many :post_cafe_tags, dependent: :destroy
 has_many :cafe_tags, through: :post_cafe_tags
 
 def save_workout_tags(tags)
   # タグが存在していれば、タグの名前を配列として全て取得
   current_tags = self.cafe_tags.pluck(:name) unless self.cafe_tags.nil?
   # 現在取得したタグから送られてきたタグを除いてoldtagとする
   old_tags = current_tags - tags
   # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
   new_tags = tags - current_tags

    # 古いタグを消す
   old_tags.each do |old_name|
   self.cafe_tags.delete PostTag.find_by(name:old_name)
   end

   # 新しいタグを保存
   new_tags.each do |new_name|
   cafe_tag = CafeTag.find_or_create_by(name:new_name)
   self.cafe_tags << cfet_tag
   end
 end
end
