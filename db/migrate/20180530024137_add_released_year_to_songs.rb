class AddReleasedYearToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :released_year, :integer
  end
end
