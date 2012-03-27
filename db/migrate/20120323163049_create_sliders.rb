class CreateSliders < ActiveRecord::Migration
  def change
    create_table :sliders do |t|
      t.string :title
      t.string :image
      t.integer :position
      t.boolean :visible

      t.timestamps
    end
  end
end
