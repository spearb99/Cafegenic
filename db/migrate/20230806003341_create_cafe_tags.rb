class CreateCafeTags < ActiveRecord::Migration[6.1]
  def change
    create_table :cafe_tags do |t|
      t.string :name, null: false
      t.timestamps
    end
      add_index :cafe_tags, :name, unique:true
  end
end
