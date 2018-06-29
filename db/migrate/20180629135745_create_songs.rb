class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist_name
      t.string :release_year
      t.boolean :released
      t.string :genre

      t.timestamps null: false
    end
  end
end
