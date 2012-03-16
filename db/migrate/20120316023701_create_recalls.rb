class CreateRecalls < ActiveRecord::Migration
  def change
    create_table :recalls do |t|
      t.string :name
      t.string :email
      t.string :type
      t.text :body

      t.timestamps
    end
  end
end
