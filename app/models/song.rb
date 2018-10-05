class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness:  {
    scope: [:release_year, :artist_name],
  }

  validates :release_year, presence: true, if: :released?
  validates :release_year, numericality: {only_integer: true, allow_nil: true, less_than_or_equal_to: Time.now.year}

  def released?
    released
  end

end
