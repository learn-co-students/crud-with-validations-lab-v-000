class Song < ActiveRecord::Base

  validates :title, presence: true
  validates_with SongsHelper::TitleDupeValidator

  validates :released, inclusion: {in: [true, false]}

  validates_with SongsHelper::ReleaseYearValidator

  validates :artist_name, presence: true

end
