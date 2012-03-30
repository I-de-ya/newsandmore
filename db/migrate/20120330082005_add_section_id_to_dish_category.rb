class AddSectionIdToDishCategory < ActiveRecord::Migration
  def change
    add_column :dish_categories, :section_id, :integer

  end
end
