class CreateDishTypes < ActiveRecord::Migration
  def change
    create_table :dish_types do |t|
      t.string :title
      t.integer :price
      t.integer :dish_id
      t.integer :position
      t.boolean :visible, :default => :true

      t.timestamps
    end
  end
end
