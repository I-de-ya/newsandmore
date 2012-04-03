class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.text :description
      t.integer :dish_category_id
      t.boolean :visible, :default => :true
      t.integer :position

      t.timestamps
    end
  end
end
