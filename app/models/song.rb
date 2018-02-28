class Song < ActiveRecord::Base
  validates :title, presence:true
  validates :released, inclusion: {in: [true, false]}
  validates :artist_name, presence:true
  validate :is_released_year, if: :released?

def is_released_year
  song = Song.find_by(title: title)

  if release_year.blank?
    errors.add(:release_year, "must be filled")
  elsif release_year > Date.today.year
    errors.add(:release_year, "Can not be made in the future.")
  elsif song && song.release_year == release_year
    errors.add(:release_year, "already exists this year")
  end
end

def released?
  released == true
end


  end
