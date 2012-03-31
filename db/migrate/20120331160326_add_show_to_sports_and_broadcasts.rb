class AddShowToSportsAndBroadcasts < ActiveRecord::Migration
  def change
  	add_column :sports, :show, :boolean, :default => :true
  	add_column :broadcasts, :show, :boolean, :default => :true
  end
end
