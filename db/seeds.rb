let(:song_attributes_1) do
  {
    title: 'Rhythms Which I Played',
    release_year: 2000,
    released: true,
    genre: 'Normcore',
    artist_name: 'Man With Instruments'
  }
end

let(:song_attributes_2) do
  {
    title: 'Rhythms Which I Played Again at a Later Time',
    release_year: 2004,
    released: true,
    genre: 'Sci-Crust Fizz-Punk',
    artist_name: 'Man With Instruments'
  }
end

Song.create([song_attributes_1, song_attributes_2])
