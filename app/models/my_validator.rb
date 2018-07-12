class MyValidator < ActiveModel::Validator
  def validate(song)
    year = song.release_year
    if song.released
      return song.errors[:release_year] << "Song must have release year." if !year
      return song.errors[:release_year] << "Release year must be a number." if year.to_s.to_i != year
      song.errors[:release_year] << "Release year must not be greater than current year." if year > 2018
    end
  end
end
