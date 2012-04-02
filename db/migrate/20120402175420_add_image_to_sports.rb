class AddImageToSports < ActiveRecord::Migration
  def change
    add_column :sports, :image, :string
    add_column :sports, :image_title, :string
  end
end
