class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :title, uniqueness: { scope: [:artist_name, :release_year], message: "Title cannot be repeated by the same artist in the same year" }
  validates :released, inclusion: { in: [true, false] }

  with_options if: :released? do |year|
    year.validates :release_year, presence: true
    year.validates :release_year, numericality: { less_than_or_equal_to: :current_year }
  end

  private

  def current_year
    Time.now.year
  end

  def released?
    released
  end
end
