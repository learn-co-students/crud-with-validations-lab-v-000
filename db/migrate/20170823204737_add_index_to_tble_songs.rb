class AddIndexToTbleSongs < ActiveRecord::Migration
  def change
    add_index :songs, [:artist_name, :release_year], unique: true
  end
end
