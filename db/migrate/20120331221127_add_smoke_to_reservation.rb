class AddSmokeToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :smoke, :boolean

  end
end
