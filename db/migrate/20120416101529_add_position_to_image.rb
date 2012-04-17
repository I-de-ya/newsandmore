class AddPositionToImage < ActiveRecord::Migration
  def change
    add_column :images, :position, :integer

  end
end
