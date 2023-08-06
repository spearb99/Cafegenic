class CreatePostCafeTags < ActiveRecord::Migration[6.1]
  def change
    create_table :post_cafe_tags do |t|
      t.integer :post_id, null: false
      t.integer :cafe_tag_id, null: false
      t.timestamps
    end
  end
end
