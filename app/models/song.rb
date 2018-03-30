class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: :release_year, message: "Title has already been used that year"}
  validates :artist_name, presence: true
  validates :released, inclusion: { in: [true, false] }

  validates :release_year, presence: true, if: [:released]

  validate :appropriate_year?

  # validate :one_per_year?


  # def one_per_year?
  #   song = Song.find_by(title: title)
  #   if song && song.release_year == self.release_year
  #     errors.add(:title, "Title has already been used that year")
  #   end
  # end

  def appropriate_year?
      if released
        if release_year.nil?
          errors.add(:release_year, "Release year must exist if it is released")
        elsif release_year > Time.now.year
          errors.add(:release_year, "Release year must be less than or equal to the current year")
        end
      end
  end

end
