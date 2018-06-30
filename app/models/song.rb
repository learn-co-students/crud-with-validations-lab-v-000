class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {
    scope: [:release_year, :artist_name],
    message: "This artist already has a song with this title in this year"
  }
  validates :released, inclusion: { in: [true, false] }
  validate :valid_release_year?
  validates :artist_name, presence: true
  validates :genre, presence: true


  def valid_release_year?
    unless self.released == false
      if self.release_year.is_a? Integer
        if !self.release_year.nil?
          unless self.release_year <= Time.now.year
            errors.add(:release_year, "The release year is in the future!")
          end
        end
      else
        errors.add(:release_year, "This song needs a release year")
      end
    end
  end
end
