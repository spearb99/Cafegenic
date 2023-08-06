class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one_attached :profile_image
  has_many :posts
  has_many :favorites, dependent: :destroy
  has_many :favorited_posts, through: :likes, source: :post

  validates :name,        presence: true
  validates :email,       presence: true, uniqueness: true

  def user_status
    if is_deleted == true
      "退会"
    else
      "有効"
    end
  end
  
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
  
   def favorited_by?(post_id)
    favorites.where(post_id: post_id).exists?
  end
end
