class ChangeRelasedtoReleasedForSongs < ActiveRecord::Migration
  def change
    rename_column :songs, :relased, :released
  end
end
