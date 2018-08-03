class AddTitleToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :title, :string
  end
end
