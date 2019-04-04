class Song < ActiveRecord::Base
  validates :title,:artist_name, presence: true
  validate :unique_title_for_year
  validates :released, inclusion: { in: [true, false], message: "value is not true or false"}
  validates :release_year, presence: true, if: :song_released?
  validates :release_year, numericality: { less_than_or_equal_to: DateTime.now.strftime("%Y").to_i},
    unless: Proc.new{|a| a.release_year.blank?}

  def unique_title_for_year
    if Song.all.any? {|song| song.title == title && song.release_year == release_year}
      errors.add(:title, "song title with the same artist and release year already exists")
    end
  end

  def song_released?
    released == true
  end

end
