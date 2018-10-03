class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.sting :artist_name
      t.string :genre
      t.integer :release_year
      t.boolean :released
    end
  end
end
