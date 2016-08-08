class SongValidator < ActiveModel::Validator
  def validate(record)
    if Song.find_by(title: record.title, release_year: record.release_year)
      record.errors[:released] << 'Cannot release a song twice in one year.'
    end
    if record.released
      if record.release_year == nil
        record.errors[:release_year] << 'Cannot have a blank release year if the song has been released.'
      end
    end
    if record.release_year
      if record.release_year > DateTime.now.year
        record.errors[:release_year] << 'Cannot release a song in the future.'
      end
    end
  end
end

class Song < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with SongValidator
  validates :title, presence: true
  validates :released, inclusion: { in: [true, false] }
end
