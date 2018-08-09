class ChangeReleaseToReleased < ActiveRecord::Migration
  def change
    rename_column :songs, :release, :released
  end
end
