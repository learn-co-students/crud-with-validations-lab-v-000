class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {scope: :release_year}
  #validate :released?
  validates :artist_name, presence: true
  validates :release_year, presence: true, numericality: {less_than_or_equal_to: Time.now.year}, if: :released

=begin
  def released?
    if released && release_year == nil
      errors.add(:release_year, "please give a release date if set as released")
    elsif release_year == nil
      return true
    elsif Date.today.cwyear <= release_year
      errors.add(:release_year, "release date must be before current date")
    end
  end
=end

end
