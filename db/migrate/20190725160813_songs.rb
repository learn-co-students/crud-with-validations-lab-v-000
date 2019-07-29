class Songs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |s|
      s.string :title
      s.boolean :released
      s.integer :release_year
      s.string :artist_name
      s.string :genre
    end
  end
end
