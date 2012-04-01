class AddPositionAndVisibleToDishType < ActiveRecord::Migration
  def change
    add_column :dish_types, :position, :integer

    add_column :dish_types, :visible, :boolean, :defaut => :true

  end
end
