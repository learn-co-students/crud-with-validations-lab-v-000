class Song < ActiveRecord::Base
  validates_with TitleValidator
  validates_with ReleaseYearValidator
  validates :title, presence: true
  validates :released, inclusion: { in: [true, false] }
  if :released == true
    validates :release_year, presence: true
  end
  validates :artist_name, presence: true
end
