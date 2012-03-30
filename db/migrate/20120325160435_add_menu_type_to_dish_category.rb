class AddMenuTypeToDishCategory < ActiveRecord::Migration
  def change
    add_column :dish_categories, :menu_type_id, :integer

  end
end