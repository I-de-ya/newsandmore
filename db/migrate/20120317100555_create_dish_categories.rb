class CreateDishCategories < ActiveRecord::Migration
  def change
    create_table :dish_categories do |t|
      t.string :name
      t.integer :section_id
      t.integer :position
      t.boolean :visible, :default => :true

      t.timestamps
    end
  end
end
