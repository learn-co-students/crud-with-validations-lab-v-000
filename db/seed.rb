# t.string :title
# t.boolean :released
# t.integer :release_year
# t.string :artist_name
# t.string :genre

Song.create!(title: 'Thriller', released: true, release_year: 1982, artist_name: 'Michael Jackson', genre: 'pop')
Song.create!(title: 'Stronger', released: true, release_year: 2007, artist_name: 'Kayne West', genre: 'Rap')
Song.create!(title: 'Youth', released: true, release_year: 2017, artist_name: 'Glass Animals', genre: 'pop')
Song.create!(title: 'Tennessee', released: true, release_year: 1972, artist_name: 'Johnny Cash', genre: 'country')
