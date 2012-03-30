class AddPositivenessToRecall < ActiveRecord::Migration
  def change
    add_column :recalls, :positiveness, :boolean

  end
end
