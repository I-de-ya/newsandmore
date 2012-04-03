class CreateSliders < ActiveRecord::Migration
  def change
    create_table :sliders do |t|
      t.text :title
      t.integer :position
      t.boolean :visible
      t.string :slider_image

      t.timestamps
    end
  end
end
