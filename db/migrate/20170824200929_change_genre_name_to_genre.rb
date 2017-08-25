class ChangeGenreNameToGenre < ActiveRecord::Migration
  def change
  	rename_column :songs, :genre_name, :genre
  end
end
