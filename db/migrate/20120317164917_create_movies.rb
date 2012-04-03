class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :origin
      t.string :genre
      t.integer :year
      t.text :description
      t.string :original_title
      t.string :director
      t.string :starring
      t.string :country
      t.date :premiere
      t.time :duration
      t.datetime :showtime
      t.string :image
      t.boolean :visible, :default => :true
      t.string :image_title

      t.timestamps
    end
  end
end
