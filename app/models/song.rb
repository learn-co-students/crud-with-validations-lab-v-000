class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: "released"
  validate :good_year

  def good_year
    if release_year
      if release_year >= Time.now.year
        self.errors[:release_year] << "Release year cannot be in the future."
      end
    end
  end

end
