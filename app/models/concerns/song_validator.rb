require 'date'
require 'pry'
class SongValidator < ActiveModel::Validator
  def validate(song)
  
    if song.released 
      if !song.release_year 
        song.errors.add(:release_year, "please enter a release year.")
      elsif song.release_year  > DateTime.now.year
        song.errors.add(:release_year, "release year is invalid.")
      end
    end
      
  end
end