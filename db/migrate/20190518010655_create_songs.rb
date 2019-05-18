class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist_name
      t.boolean :released
      t.string :genre
      t.integer :release_year

      t.timestamps null: false
    end
  end
end
