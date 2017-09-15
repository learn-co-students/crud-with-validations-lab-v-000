class RenameArtostNameToArtistName < ActiveRecord::Migration
  def change
  	rename_column :songs, :artost_name, :artist_name
  end
end
