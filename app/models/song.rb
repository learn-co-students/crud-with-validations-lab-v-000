class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :release_year, numericality: {less_than_or_equal_to: Time.new.year}, if: :needs_release_year
  validates :title, uniqueness: true

  def needs_release_year
    true if self.released
  end

end
