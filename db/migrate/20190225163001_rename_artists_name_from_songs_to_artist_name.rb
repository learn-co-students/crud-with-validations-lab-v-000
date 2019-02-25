class RenameArtistsNameFromSongsToArtistName < ActiveRecord::Migration
  def change
    rename_column :songs, :artists_name, :artist_name
  end
end
