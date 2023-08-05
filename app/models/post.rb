class Post < ApplicationRecord
 belongs_to :user
 has_one_attached :post_image
 has_many :favorites, dependent: :destroy
 has_many :post_users, through: :favorite, source: :user

 def favorited_by?(user)
     favorites.exists?(user_id: user.id)
 end

end
