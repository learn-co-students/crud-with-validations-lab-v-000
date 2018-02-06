class CreateSongsTable < ActiveRecord::Migration
  create_table :songs do |t|
    t.string :title
    t.integer :release_year
    t.boolean :released
    t.string :genre
    t.string :artist_name
  end
end