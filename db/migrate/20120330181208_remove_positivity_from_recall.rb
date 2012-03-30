class RemovePositivityFromRecall < ActiveRecord::Migration
  def up
    remove_column :recalls, :positivity
      end

  def down
    add_column :recalls, :positivity, :string
  end
end
