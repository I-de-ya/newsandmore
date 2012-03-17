class AddShowtimeToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :showtime, :datetime

  end
end
