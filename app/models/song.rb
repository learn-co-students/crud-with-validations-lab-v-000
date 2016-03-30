class SongUniquePerYearValidator < ActiveModel::Validator
  def validate(record)
    if !!Song.find_by(title: record.title, artist_name: record.artist_name, release_year: record.release_year)
      record.errors[:title] << 'This song has already been released this year!'
    end
  end
end

class Song < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with SongUniquePerYearValidator

  validates :title, :artist_name, presence: true

  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :is_released?
  validates :release_year, numericality: {less_than_or_equal_to: Time.now.year}, if: :is_released?

  def is_released?
    released == true
  end
end
