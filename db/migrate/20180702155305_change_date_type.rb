class ChangeDateType < ActiveRecord::Migration
  def change
    change_column :songs, :release_year, :integer
  end
end
