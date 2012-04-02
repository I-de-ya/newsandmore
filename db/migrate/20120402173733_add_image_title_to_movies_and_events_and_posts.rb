class AddImageTitleToMoviesAndEventsAndPosts < ActiveRecord::Migration
  def up
    add_column :events, :image_title, :string
    add_column :movies, :image_title, :string
    add_column :posts, :image_title, :string
  end
  def down
    remove_column :events, :image_title
    remove_column :movies, :image_title
    remove_column :posts, :image_title
  end
end
