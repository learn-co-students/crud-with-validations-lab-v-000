require 'pry'

class MyValidator < ActiveModel::Validator
  def validate(record)
    #Song Title Validation
    if record.title
      Song.all.each do |song|
        if song.artist_name == record.artist_name && song.release_year == record.release_year && song.id != record.id
          record.errors[:base] << (options[:message] || "cannot release same song twice in one year")
        end
      end
    end
    #Song Release Year Validation
    if record.released && record.release_year == nil
      record.errors[:base] << (options[:message] || "must have a release_year if released")
    end
    if record.release_year
      if record.release_year > 2017
        record.errors[:base] << (options[:message] || "cannot be released in the future")
      end
    end
  end
end