class PostCafeTag < ApplicationRecord
  belongs_to :post
  belongs_to :cafe_tag
end
