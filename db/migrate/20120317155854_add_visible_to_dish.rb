class AddVisibleToDish < ActiveRecord::Migration
  def change
    add_column :dishes, :visible, :boolean, :default => :true

  end
end
