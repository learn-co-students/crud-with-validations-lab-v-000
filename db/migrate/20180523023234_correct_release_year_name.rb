class CorrectReleaseYearName < ActiveRecord::Migration
  def change
    rename_column :songs, :release_year, :release_year
  end
end
