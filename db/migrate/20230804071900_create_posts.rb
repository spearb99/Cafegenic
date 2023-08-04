class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.string :shop_name, null: false
      t.text :text, null: false
      t.string :address, null: false
      t.float :longitude
      t.float :latitude
      t.timestamps
    end
  end
end
