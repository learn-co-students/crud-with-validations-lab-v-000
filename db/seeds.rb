# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Song.create([{title: 'Schema', release_year: '1999', artist_name: 'Bob Dole', genre: 'Rock'}, {title: 'Roots', release_year: '2020', artist_name: 'Al Gore', genre: 'Rap'}]);