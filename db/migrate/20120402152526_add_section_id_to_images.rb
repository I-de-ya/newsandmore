class AddSectionIdToImages < ActiveRecord::Migration
  def change
    add_column :images, :section_id, :integer

  end
end
