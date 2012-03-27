class AddShoToEvent < ActiveRecord::Migration
  def change
    add_column :events, :show, :boolean, :default => true

  end
end
