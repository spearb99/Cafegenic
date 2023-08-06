class PostCafeTag < ApplicationRecord
  belongs_to :post_cafe
  belongs_to :cafe_tag
end
