class AddPostToPostCafeTag < ActiveRecord::Migration[6.1]
  def change
    add_reference :post_cafe_tags, :post, null: false, foreign_key: true
    add_reference :cafe_tags, :cafe_tag, null: false,foreign_key: true
  end
end
