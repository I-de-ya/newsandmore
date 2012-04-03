class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :image
      t.boolean :visible, :default => :true
      t.string :image_title

      t.timestamps
    end
  end
end
