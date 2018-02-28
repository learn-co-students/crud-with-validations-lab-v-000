class CreateTableForSongs < ActiveRecord::Migration
  def change
    create_table :table_for_songs do |t|
      t.string :title
      t.boolean :released
      t.integer :release_year
      t.string :artist_name
      t.string :genre
    end
  end
end
