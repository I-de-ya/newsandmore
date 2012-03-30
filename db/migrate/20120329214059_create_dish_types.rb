class CreateDishTypes < ActiveRecord::Migration
  def change
    create_table :dish_types do |t|
      t.string :title
      t.integer :price
      t.integer :dish_id

      t.timestamps
    end
  end
end
