class AddShowColumnToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :show, :boolean, :default => :true
  end
end
