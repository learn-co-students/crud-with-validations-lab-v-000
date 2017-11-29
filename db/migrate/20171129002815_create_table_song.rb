class CreateTableSong < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist_name
      t.integer :release_year
      t.string :released
    end
  end
end
