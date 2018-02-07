require 'pry'
class MyValidator < ActiveModel::Validator
  def validate(record)
    if record.released == true 
      if record.release_year.nil?
        record.errors[:release_year] << "Must have a release year"
      end
      if record.release_year && record.release_year > Time.now.year
        record.errors[:release_year] << "May not be released in the future!"
      end
    end

    song = Song.find_by(title: record.title)
    if song
      if song.release_year == record.release_year 
        record.errors[:title] << "Artist already released a song of that title in this year" unless record == song
      end
    end
  end
end
class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validates_inclusion_of :released, :in => [true, false]
  validates_with MyValidator 
end
