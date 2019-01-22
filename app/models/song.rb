class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :released, inclusion: { in: [true, false] }
  validate :released_yet
  validates :artist_name, presence: true



  def released_yet
    if released
      if release_year.blank?
        errors.add(:release_year, "released but doesn't have a release year")
      elsif release_year > Time.now.year
        errors.add(:release_year, "can't be released in the future")
      end
    end
  end


end
