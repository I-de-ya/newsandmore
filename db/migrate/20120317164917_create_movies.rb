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

      t.timestamps
    end
  end
end
