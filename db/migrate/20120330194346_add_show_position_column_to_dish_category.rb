class AddShowPositionColumnToDishCategory < ActiveRecord::Migration
  def change
    add_column :dish_categories, :show, :boolean, :default => :true

    add_column :dish_categories, :position, :integer

    add_column :dish_categories, :column, :integer

  end
end
