class AddPositionToSection < ActiveRecord::Migration
  def change
    add_column :sections, :position, :integer

  end
end
