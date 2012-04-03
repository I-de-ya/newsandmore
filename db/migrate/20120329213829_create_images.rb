class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.string :image
      t.integer :section_id
      t.boolean :visible, :default => :true

      t.timestamps
    end
  end
end
