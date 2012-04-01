class AddShowToRecall < ActiveRecord::Migration
  def change
    add_column :recalls, :show, :boolean, :default => :true

  end
end