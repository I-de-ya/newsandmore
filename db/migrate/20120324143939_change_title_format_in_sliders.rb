class ChangeTitleFormatInSliders < ActiveRecord::Migration
  def up
  	change_column :sliders, :title, :text
  end

  def down
  	change_column :sliders, :title, :string
  end
end
