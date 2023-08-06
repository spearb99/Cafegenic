class CreatePostCafeTags < ActiveRecord::Migration[6.1]
  def change
    create_table :post_cafe_tags do |t|

      t.timestamps
    end
  end
end
