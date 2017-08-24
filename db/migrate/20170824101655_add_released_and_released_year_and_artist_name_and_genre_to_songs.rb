class AddReleasedAndReleasedYearAndArtistNameAndGenreToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :released, :boolean
    add_column :songs, :release_year, :integer
    add_column :songs, :artist_name, :string
    add_column :songs, :genre, :string
  end
end
