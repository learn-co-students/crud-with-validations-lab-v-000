class Song < ActiveRecord::Base
	validates :title, presence: true
	validates :title, uniqueness: { scope: [:artist_name, :release_year]}
	validates :artist_name, presence: true
	validates :released, :inclusion => { :in => [true, false] }
	validates :release_year, presence: true, if: -> { released == true }
	validate :release_year_must_be_less_than_or_equal_to_the_current_year

  def release_year_must_be_less_than_or_equal_to_the_current_year
    if release_year.present? && release_year > Date.today.year
      errors.add(:release_year, "must be less than or equal to the current year.")
    end
  end    

end
