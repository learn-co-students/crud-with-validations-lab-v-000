class Song < ActiveRecord::Base
  validates :title, presence: true,
            uniqueness: {scope: [:release_year, :artist_name],
            message: "Can't have same title by the same artist in the same year"
          }
  validates_presence_of :release_year, if: :released
  validate :release_year_cannot_be_in_the_future
  validates :artist_name, presence: true

  def release_year_cannot_be_in_the_future
     if release_year.present? && release_year >= Date.today.year
       errors.add(:release_year, "can't be in the future")
     end
  end
end
