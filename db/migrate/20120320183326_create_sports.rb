class CreateSports < ActiveRecord::Migration
  def change
    create_table :sports do |t|
      t.string :title
      t.boolean :visible, :default => :true
      t.string :image
      t.string :image_title

      t.timestamps
    end
  end
end
