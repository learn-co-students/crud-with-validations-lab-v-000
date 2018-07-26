class ChangeGenreColumn < ActiveRecord::Migration
  def change
    rename_column :songs, :genre_string, :genre
  end
end
