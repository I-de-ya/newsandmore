class AddShowToMovies < ActiveRecord::Migration
  def change
  	add_column :movies, :show, :boolean, :default => :true
  end
end
