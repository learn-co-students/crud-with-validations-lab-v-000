class RemoveReleasedYearFromSongs < ActiveRecord::Migration
  def change
    remove_column :songs, :released_year, :integer
  end
end
