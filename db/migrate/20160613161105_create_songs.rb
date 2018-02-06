class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.text :title
      t.text :artist_name
      t.integer :release_year
      t.boolean :released
      t.text :genre

      t.timestamps null: false
    end
  end
end
