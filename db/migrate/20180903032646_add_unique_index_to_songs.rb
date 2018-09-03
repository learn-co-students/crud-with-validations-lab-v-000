class AddUniqueIndexToSongs < ActiveRecord::Migration
  def change
    add_index :songs, :artist_name, unique: true
    add_index :songs, :release_year, unique: true
  end
end
