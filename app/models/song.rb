class Song < ActiveRecord::Base
  validates :title,:artist_name, presence: true
  validate :unique_title_for_year
  validates :released, inclusion: { in: [true, false]}, message: "value is not true or false"
  validates :release_year, presence: true, if: :released?
  validates :release_year, numerically: { less_than_or_equal_to: DateTime.now.strftime("%Y").to_i}

  def unique_title_for_year
    if Song.all.any? {|song| song.title == title && song.release_year == release_year}
      errors.add(:title, "song title with the same artist and release year already exists")
    end
  end

  def released?
    !!released
  end

  def check_release_for_boolean_type
    errors.add(:released, 'needs to be true or false') unless released.is_a?(Boolean)
  end

  def check_title_for_string_type

  end

  def check_artist_name_for_string_type

  end

end
