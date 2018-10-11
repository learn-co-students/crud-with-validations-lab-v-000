class AddTitleArtistNameGenreToSong < ActiveRecord::Migration
  def change
    add_column :songs, :title, :string
    add_column :songs, :artist_name, :string
    add_column :songs, :genre, :string
    add_column :songs, :released, :boolean
  end
end
