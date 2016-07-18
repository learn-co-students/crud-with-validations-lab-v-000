class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :released, inclusion: { in: [true, false] }
  validate :released_year


  def released_year
    if released == true && release_year == nil
      errors.add(:release_year, "year must not be empty.")
    elsif released == true && release_year.to_i > Time.now.year
      errors.add(:release_year, "must be greater than or equal to the current year.")
    elsif released == true && Song.all.any? {|song| song.title == title}
      errors.add(:song, "cannot be released again.")
    end
  end


end
