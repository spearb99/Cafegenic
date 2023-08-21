class CafeTag < ApplicationRecord
  has_many :post_cafe_tags, foreign_key: 'cafe_tag_id', dependent: :destroy
  has_many :posts, through: :post_cafe_tags, dependent: :destroy


  validates :name, presence:true, length:{maximum:50}
end