class CreateBroadcasts < ActiveRecord::Migration
  def change
    create_table :broadcasts do |t|
      t.string :title
      t.datetime :showtime
      t.integer :sport_id
      t.boolean :visible, :default => :true

      t.timestamps
    end
  end
end
