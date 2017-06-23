class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: :artist,  message: "should happen once per artist" }
  validates :released, presence: true, inclusion: { in: %w(True False)}
  validates :artist_name, presence: true
  validates :needs_release_year

  def needs_release_year
     if released
       validates :release_year, presence: true, numericality: {:greater_than_or_equal_to Time.now.year}
     end
  end
end
