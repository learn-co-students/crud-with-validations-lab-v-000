class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: [:artist_name, :release_year]}
  validates :artist_name, presence: true
  validates :release_year, numericality: {less_than_or_equal_to: DateTime.now.year}, presence: true, if: :release_true?


  def release_true?
    released
  end


end
