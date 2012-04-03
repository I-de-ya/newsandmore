class CreateReservations < ActiveRecord::Migration
  def self.up
    create_table :reservations do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.integer :persons
      t.text :comment
      t.string :phone
      t.boolean :smoke
      t.integer :hall
      t.datetime :date_and_time


      t.timestamps
    end
  end
  def self.down
    drop_table :reservations
  end
end
