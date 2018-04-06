class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title, :genre, :artist_name
      t.boolean :released
      t.integer :release_year 
      t.timestamps null: false
    end
  end
end
