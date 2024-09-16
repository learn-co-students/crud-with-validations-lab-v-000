class Song < ApplicationRecord
  validates :title, :artist_name, presence: true
  validates :title, uniqueness: { scope: [:release_year, :artist_name] }

  validates :release_year, presence: true, if: :released_valid?
  validates :release_year, numericality: { less_than_or_equal_to: Time.now.year }, allow_nil: true


  def released_valid?
    released
  end
end
