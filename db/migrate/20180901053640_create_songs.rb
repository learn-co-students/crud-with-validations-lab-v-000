class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.boolean :released
      t.string :artist_name
      t.string :genre
      t.string :release_year

      t.timestamps null: false
    end
  end
end
