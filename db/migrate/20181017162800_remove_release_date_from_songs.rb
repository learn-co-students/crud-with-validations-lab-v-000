class RemoveReleaseDateFromSongs < ActiveRecord::Migration
  def change
    remove_column :songs, :release_date, :integer
  end
end
