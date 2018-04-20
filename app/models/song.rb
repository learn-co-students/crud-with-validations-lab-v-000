class Song < ActiveRecord::Base
  validates :title, presence: true
  validate :year_passed?
  validates :released, inclusion: { in: [ true, false ] }
  validates :release_year, presence: true, if: :released != false
  validates :artist_name, presence: true

  def year_passed?
    created_at <= 1.year.ago
  end
end
