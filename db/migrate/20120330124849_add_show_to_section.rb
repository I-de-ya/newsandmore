class AddShowToSection < ActiveRecord::Migration
  def change
    add_column :sections, :show, :boolean, :default => :true

  end
end
