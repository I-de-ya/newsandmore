class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.integer :dish_category_id
      t.integer :portion

      t.timestamps
    end
  end
end
