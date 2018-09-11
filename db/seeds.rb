song_list = [
  ["Hotline Bling", true, 2016, "Drake", "hip hop"],
  ["Bodak Yello", true, 2017, "Cardi B", "rap"],
  ["Thunderclouds", true, 2018, "LSD", "pop"]
]

song_list.each do |title, released, year, artist, genre|
  Song.create(title: title, released: released, release_year: year, artist_name: artist, genre: genre)
end
