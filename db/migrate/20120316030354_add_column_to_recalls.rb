class AddColumnToRecalls < ActiveRecord::Migration
  def self.up
    add_column :recalls, :positivity, :string
    remove_column :recalls, :type
  end

  def self.down
    remove_column :recalls, :positivity
    add_column :recalls, :type, :string
  end

end
