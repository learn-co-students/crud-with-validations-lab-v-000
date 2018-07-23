rails g resource Song title:string released:boolean release_year:integer artist_name:string genre:string --no-test-framework


song_attributes_1 = {
  title: "Rhythms Which I Played",
  release_year: 2000,
  released: true,
  genre: "Normcore",
  artist_name: "Man With Instruments"
}

song_attributes_2 = 
  {
    title: "Rhythms Which I Played Again at a Later Time",
    release_year: 2004,
    released: true,
    genre: "Sci-Crust Fizz-Punk",
    artist_name: "Man With Instruments"
  }
