class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.text :title
      t.boolean :released
      t.integer :release_year
      t.text :artist_name
      t.text :genre
      t.timestamps null: false
    end
  end
end
