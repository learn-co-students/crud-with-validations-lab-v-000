song_list = [
  ['Promise', true, 2010, 'Usher', 'PoP'],
  ['YaYa',	true, 2000, 'Usher', 'PoP'],
  ['Dance Theme',	false, nil, 'Usher', 'PoP'],
  ['Mi Nuevea Cancion',	false, nil, 'Prince Royce', 'Latin'],
  ['Corazon Sin Cara', true,	2010,	'Prince Royce', 'Latin']
]

song_list.each do |song|
  Song.create(title: song[0], released: song[1], release_year: song[2],
              artist_name: song[3], genre: song[4])
end
