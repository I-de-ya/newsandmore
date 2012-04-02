class AddShowToImages < ActiveRecord::Migration
  def change
    add_column :images, :show, :boolean, :default => :true
  end
end
