class CreatePostCafeTags < ActiveRecord::Migration[6.1]
  def change
    create_table :post_cafe_tags do |t|
      t.references :post_cafe, null: false, foreign_key: true
      t.references :cafet_tag, null: false, foreign_key: true
      t.timestamps
    end
    add_index :post_cafe_tags, [:post_cafe_id,:cafe_tag_id],unique: true
  end
end
