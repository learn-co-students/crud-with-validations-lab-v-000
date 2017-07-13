class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: :release_year, message: 'song title already taken for the same release year'}
  validates :released, inclusion: [true,false]
  validates :release_year, numericality: {only_integer: true, less_than_or_equal_to: DateTime.now.year }, if: Proc.new {|song| song.released == true}
  validates :artist_name, presence: true
end
