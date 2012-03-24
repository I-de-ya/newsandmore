class AddColumnsToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :datetime, :datetime

    add_column :reservations, :phone, :string

    add_column :reservations, :smokers, :integer

    add_column :reservations, :hall, :integer

  end
end
