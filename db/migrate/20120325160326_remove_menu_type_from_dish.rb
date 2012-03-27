class RemoveMenuTypeFromDish < ActiveRecord::Migration
  def up
    remove_column :dishes, :menu_type_id
      end

  def down
    add_column :dishes, :menu_type_id, :integer
  end
end