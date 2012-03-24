class RemoveImageAndAddImageSliderToSliders < ActiveRecord::Migration
  def up
  	remove_column :sliders, :image
  	add_column :sliders, :slider_image, :string
  end

  def down
  	add_column :sliders, :image, :string
  	remove_column :sliders, :slider_image
  end
end
