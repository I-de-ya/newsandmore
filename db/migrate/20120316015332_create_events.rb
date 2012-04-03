class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :body
      t.date :date
      t.string :image_title
      t.string :image
      t.boolean :show, :default => true

      t.timestamps
    end
  end
end
