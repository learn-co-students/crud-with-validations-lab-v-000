class AddReleaseYearToSongs < ActiveRecord::Migration[5.0]
  def change
    add_column :songs, :release_year, :integer
  end
end
