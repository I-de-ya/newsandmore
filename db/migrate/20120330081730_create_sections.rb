class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :title
      t.text :body
      t.integer :position
      t.boolean :visible, :default => :true
      t.string :slug

      t.timestamps
    end
  end
end
