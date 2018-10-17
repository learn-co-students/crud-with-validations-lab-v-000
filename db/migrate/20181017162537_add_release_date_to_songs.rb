class AddReleaseDateToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :release_date, :integer
  end
end
