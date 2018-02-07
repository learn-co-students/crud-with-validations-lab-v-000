class AddReleasedToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :released, :boolean
  end
end
