class RenameReleaseYearColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :songs, :release_year, :year
  end
end
