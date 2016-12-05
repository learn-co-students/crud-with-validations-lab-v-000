class RemoveGenreNameFromSongs < ActiveRecord::Migration
  def change
    remove_column :songs, :genre_name, :string
    add_column :songs, :genre, :string
  end
end
