class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: :year}
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, numericality: {only_integer:true}, presence: true, unless: :released == "false"
  validate :release_year_cannot_be_in_the_past, unless: :released == "false"
  validates :artist_name, presence: true

    def release_year_cannot_be_in_the_past
        if release_year < Time.current.year

          errors.add(:release_year, "can't be in the past")
        end
    end

end
