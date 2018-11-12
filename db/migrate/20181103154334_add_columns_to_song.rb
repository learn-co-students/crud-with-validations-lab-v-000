class AddColumnsToSong < ActiveRecord::Migration
  def change
    add_column :songs, :title, :string
    add_column :songs, :released, :boolean
    add_column :songs, :released_year, :integer
    add_column :songs, :artist_name, :string
    add_column :songs, :genre, :string
  end
end
