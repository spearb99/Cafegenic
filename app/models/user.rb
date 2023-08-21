class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one_attached :profile_image
  has_many :posts

  # フォローをした、されたの関係
  has_many :followers, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followeds, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  # 一覧画面で使う
  has_many :following_users, through: :followers, source: :followed
  has_many :follower_users, through: :followeds, source: :follower
  # いいね
  has_many :favorites, dependent: :destroy
  
  # コメント
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy


  validates :name,        presence: true
  validates :email,       presence: true, uniqueness: true

  def user_status
    if is_deleted == true
      "退会"
    else
      "有効"
    end
  end
  
  def active_for_authentication?
    super && (is_deleted == false)
  end
  
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
  
  #　フォローしたときの処理
  def follow(user_id)
    followers.create(followed_id: user_id)
  end

#　フォローを外すときの処理
  def unfollow(user_id)
    followers.find_by(followed_id: user_id).destroy
  end

#フォローしていればtrueを返す
  def following?(user)
    following_users.include?(user)
  end	 
  
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
      user.name = "ゲストユーザー"
   end
  end
  
  def self.search(search)
      User.where('users.name LIKE(?)' ,"%#{search}%")
  end
end
