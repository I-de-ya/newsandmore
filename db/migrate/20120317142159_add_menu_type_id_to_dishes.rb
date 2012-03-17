class AddMenuTypeIdToDishes < ActiveRecord::Migration
  def change
    add_column :dishes, :menu_type_id, :integer

  end
end
