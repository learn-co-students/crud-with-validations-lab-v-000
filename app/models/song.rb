class MyValidator < ActiveModel::Validator
  def validate(record)
    if record.released == true
      unless record.release_year != nil && record.release_year<2018
        record.errors[:release_year] << 'Need a release year that is not in the future.'
      end
    #  if Song.all.include?(record.title && record.artist_name && record.release_year) == true
    #    record.errors[:title] << 'This title has already been released this year.'
    #  end
    end
  end
end

class Song < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true, uniqueness: true
  validates :artist_name, presence: true

  validates_with MyValidator
end
