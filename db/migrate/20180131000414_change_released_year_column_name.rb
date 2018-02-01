class ChangeReleasedYearColumnName < ActiveRecord::Migration
  def change
    rename_column :songs, :released_year, :release_year
  end
end
