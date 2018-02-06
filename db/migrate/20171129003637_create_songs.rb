class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.text :name
      t.boolean :released
      t.integer :release_year
      t.string :artist_name
      t.string :genre
      
      t.timestamps null: false
    end
  end
end
