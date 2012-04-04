class CreateRecalls < ActiveRecord::Migration
  def change
    create_table :recalls do |t|
      t.string :name
      t.string :email
      t.text :body
      t.boolean :positiveness, :default => :true
      t.boolean :visible, :default => :true

      t.timestamps
    end
  end
end
