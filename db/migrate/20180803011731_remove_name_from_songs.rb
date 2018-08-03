class RemoveNameFromSongs < ActiveRecord::Migration
  def change
    remove_column :songs, :name, :string
  end
end
