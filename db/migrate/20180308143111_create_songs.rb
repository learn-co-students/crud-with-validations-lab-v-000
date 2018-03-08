class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :release_year
      t.string :integer
      t.string :artist_name
      t.string :genre

      t.timestamps null: false
    end
  end
end
