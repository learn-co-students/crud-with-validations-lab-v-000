class RemoveReleasedYearFromSongs < ActiveRecord::Migration[5.0]
  def change
    remove_column :songs, :released_year, :integer
  end
end
