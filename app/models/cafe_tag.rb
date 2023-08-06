class CafeTag < ApplicationRecord
  has_many :post_cafe_tags, dependent: :destroy
  has_many :post_cafes, through: :post_cafe_tags

  validates :name, presence:true, length:{maximum:50}
end
