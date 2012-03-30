class CreateMenuSections < ActiveRecord::Migration
  def change
    create_table :menu_sections do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
